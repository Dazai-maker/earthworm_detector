import numpy as np
import serial
import cv2

# Dimensions de la fenêtre (Hauteur = 1080, Largeur = 1920)
width = 1080
hight = 1920

SERIAL_PORT = '/dev/ttyACM0' 
BAUD_RATE = 115200


try:
    ser = serial.Serial(port=SERIAL_PORT, baudrate=BAUD_RATE, timeout=0.1)
except Exception as e:
    print(f"Erreur Port Série : {e}")
    ser = None


def coord_read(ser):
    #Lit une ligne sur le port série et renvoie un array NumPy [distance, angle] ou None.
    if ser is None or not ser.is_open:
        return None
    try:
        line_data = ser.readline().decode().strip()
        if line_data:
            data = line_data.split()[0].split(',')
            if len(data) >= 2:
                # Renvoie un array NumPy d'entiers
                return np.array([int(data[0]), int(data[1])], dtype=int)
    except Exception:
        pass
    return None


def sonar_affichage(coord):
    WINDOW_NAME = 'Radar STM32 (360°)'
    
    # Force OpenCV à réutiliser la même fenêtre
    cv2.namedWindow(WINDOW_NAME, cv2.WINDOW_AUTOSIZE)

    # Image de fond
    img = np.zeros((width, hight, 3), dtype=np.uint8)

    # On décale le centre du radar vers la gauche pour laisser de la place au panneau à droite
    panel_width = 450
    center_x = (hight - panel_width) // 2
    center_y = width // 2

    # Conversion polaire -> cartésien (x, y)
    def pos_angle(base_angle, length):
        x = int(center_x + length * np.cos(np.radians(base_angle)))
        y = int(center_y - length * np.sin(np.radians(base_angle)))
        return (x, y)

    # Dessin du cadran radar
    for base_angle in range(0, 360, 30):
        cv2.line(img, pt1=pos_angle(base_angle, 330), pt2=(center_x, center_y), color=[0, 255, 0], thickness=1)

    for r in range(50, 340, 70):
        cv2.circle(img, (center_x, center_y), r, color=[0, 255, 0], thickness=1)

    for ang in range(0, 360, 30):
        pt_txt = pos_angle(ang, 355)
        cv2.putText(img, f"{ang}°", org=pt_txt, fontFace=cv2.FONT_HERSHEY_TRIPLEX, fontScale=0.4, color=(0, 255, 0), thickness=1)

    # --- Dessin fixe du panneau latéral à droite ---
    panel_x_start = hight - panel_width
    cv2.rectangle(img, (panel_x_start, 0), (hight, width), (30, 30, 30), -1)  # Fond gris foncé
    cv2.line(img, (panel_x_start, 0), (panel_x_start, width), (0, 255, 0), 2)  # Ligne de séparation verte

    cv2.putText(img, "COORDONNEES RECUES", (panel_x_start + 30, 50),
                cv2.FONT_HERSHEY_TRIPLEX, 0.7, (0, 255, 0), 1)

    background = img.copy()

    entered_key = -1

    # BOUCLE UNIQUE D'AFFICHAGE
    while entered_key == -1:
        frame = background.copy()

        # Lecture : renvoie un array [distance, angle] ou None
        new_coord = coord_read(ser)
        if new_coord is not None:
            coord.append(new_coord)

        # 1. Affichage des points sur le radar
        for dist, ang in coord:
            dist_interp = np.interp(dist, [0, 40], [0, 330])
            pt = pos_angle(ang, dist_interp)
            cv2.circle(frame, center=pt, radius=3, color=(0, 255, 0), thickness=-1)

        # 2. Affichage des coordonnées dans le panneau latéral
        cv2.putText(frame, f"Total points : {len(coord)}", (panel_x_start + 30, 90),
                    cv2.FONT_HERSHEY_SIMPLEX, 0.6, (255, 255, 255), 1)

        # En-tête de tableau
        cv2.putText(frame, "N.   Distance   Angle", (panel_x_start + 30, 130),
                    cv2.FONT_HERSHEY_SIMPLEX, 0.6, (0, 255, 255), 1)
        cv2.line(frame, (panel_x_start + 20, 140), (hight - 20, 140), (100, 100, 100), 1)

        # Affiche les 25 derniers points reçus
        max_items_to_show = 25
        recent_coords = coord[-max_items_to_show:]
        
        start_y = 170
        for idx, item in enumerate(reversed(recent_coords)):
            dist, ang = item[0], item[1]
            point_num = len(coord) - idx
            text = f"#{point_num:<3}  {dist:>3} cm     {ang:>3} deg"
            
            # Le point le plus récent est en vert, les plus anciens en blanc
            color = (0, 255, 0) if idx == 0 else (200, 200, 200)
            cv2.putText(frame, text, (panel_x_start + 30, start_y + (idx * 30)),
                        cv2.FONT_HERSHEY_SIMPLEX, 0.5, color, 1)

        cv2.imshow(WINDOW_NAME, frame)
        entered_key = cv2.waitKey(10)

    if ser and ser.is_open:
        ser.close()
    cv2.destroyAllWindows()


# TEST
if __name__ == "__main__":
    mes_coordonnees = [[30, 79], [80, 78], [67, 69]]
    sonar_affichage(mes_coordonnees)