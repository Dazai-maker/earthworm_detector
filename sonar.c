#include "raylib.h"
#include <math.h>
#include <stdlib.h>
#include <time.h>

#define SCREEN_WIDTH 800
#define SCREEN_HEIGHT 800
#define MAX_TARGETS 5

typedef struct Target {
    Vector2 position;
    float alpha;
    bool active;
} Target;

int main(void) {
    // Initialisation de la fenêtre
    InitWindow(SCREEN_WIDTH, SCREEN_HEIGHT, "Military Sonar Screen Simulation");
    SetTargetFPS(60);
    srand(time(NULL));

    Vector2 center = { SCREEN_WIDTH / 2.0f, SCREEN_HEIGHT / 2.0f };
    float maxRadius = 350.0f;
    float sweepAngle = 0.0f;
    float sweepSpeed = 1.5f; // Vitesse de rotation

    // Génération de cibles aléatoires
    Target targets[MAX_TARGETS];
    for (int i = 0; i < MAX_TARGETS; i++) {
        float angle = (float)(rand() % 360) * DEG2RAD;
        float radius = (float)(rand() % (int)(maxRadius - 50)) + 30;
        targets[i].position.x = center.x + cosf(angle) * radius;
        targets[i].position.y = center.y + sinf(angle) * radius;
        targets[i].alpha = 0.0f;
        targets[i].active = true;
    }

    // Boucle principale
    while (!WindowShouldClose()) {
        // --- MISE À JOUR ---
        // Rotation de la ligne de balayage
        sweepAngle += sweepSpeed;
        if (sweepAngle >= 360.0f) sweepAngle -= 360.0f;

        float sweepRad = sweepAngle * DEG2RAD;

        // Logique de détection des cibles
        for (int i = 0; i < MAX_TARGETS; i++) {
            if (!targets[i].active) continue;

            // Calcul de l'angle de la cible par rapport au centre
            float targetAngle = atan2f(targets[i].position.y - center.y, targets[i].position.x - center.x) * RAD2DEG;
            if (targetAngle < 0) targetAngle += 360.0f;

            // Si le balayage passe sur la cible, on illumine la cible (alpha max)
            if (fabsf(sweepAngle - targetAngle) < 2.0f) {
                targets[i].alpha = 1.0f;
            } else {
                // Diminution progressive de l'intensité (effet de rémanence du phosphore)
                targets[i].alpha -= 0.005f;
                if (targets[i].alpha < 0.0f) targets[i].alpha = 0.0f;
            }
        }

        // --- DESSIN ---
        BeginDrawing();
        ClearBackground(BLACK);

        // 1. Grilles de cercles concentriques (Style CRT Militaire)
        for (int r = 50; r <= maxRadius; r += 75) {
            DrawCircleLines(center.x, center.y, r, DARKGREEN);
        }

        // 2. Lignes d'axes (Azimut)
        DrawLine(center.x - maxRadius, center.y, center.x + maxRadius, center.y, DARKGREEN);
        DrawLine(center.x, center.y - maxRadius, center.x, center.y + maxRadius, DARKGREEN);

        // 3. Dessin des cibles détectées (Rémanence)
        for (int i = 0; i < MAX_TARGETS; i++) {
            if (targets[i].alpha > 0.0f) {
                Color targetColor = (Color){ 0, 255, 0, (unsigned char)(targets[i].alpha * 255) };
                // Point central de la cible
                DrawCircleV(targets[i].position, 5, targetColor);
                // Cercle d'alerte autour de la cible
                DrawCircleLines(targets[i].position.x, targets[i].position.y, 12, targetColor);
            }
        }

        // 4. Ligne de balayage principale (Sweep)
        Vector2 sweepEnd = {
            center.x + cosf(sweepRad) * maxRadius,
            center.y + sinf(sweepRad) * maxRadius
        };
        DrawLineEx(center, sweepEnd, 3.0f, GREEN);

        // 5. Effet de traînée du balayage (Optionnel - Ombre légère en arrière)
        float trailRad = (sweepAngle - 4.0f) * DEG2RAD;
        Vector2 trailEnd = { center.x + cosf(trailRad) * maxRadius, center.y + sinf(trailRad) * maxRadius };
        DrawLineEx(center, trailEnd, 1.5f, LIME);

        // Interface textuelle
        DrawText("SONAR SYSTEM ACTIVE", 20, 20, 20, GREEN);
        DrawText(TextFormat("SWEEP ANGLE: %03.1f", sweepAngle), 20, 50, 16, DARKGREEN);

        EndDrawing();
    }

    CloseWindow();
    return 0;
}
