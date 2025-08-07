#include "helpers.h"
#include <math.h>

// Convert image to grayscale
void grayscale(int height, int width, RGBTRIPLE image[height][width])
{
    for (int i = 0; i < height; i++)
    {
        for (int j = 0; j < width; j++)
        {
            int avg =
                roundf((image[i][j].rgbtRed + image[i][j].rgbtBlue + image[i][j].rgbtGreen) / 3.0);
            image[i][j].rgbtRed = avg;
            image[i][j].rgbtBlue = avg;
            image[i][j].rgbtGreen = avg;
        }
    }
    return;
}

// Convert image to sepia
void sepia(int height, int width, RGBTRIPLE image[height][width])
{
    for (int i = 0; i < height; i++)
    {
        for (int j = 0; j < width; j++)
        {
            int R = image[i][j].rgbtRed;
            int G = image[i][j].rgbtGreen;
            int B = image[i][j].rgbtBlue;

            int newRed = roundf(0.393 * R + 0.769 * G + 0.189 * B);
            newRed = (newRed <= 255) ? newRed : 255;

            int newBlue = roundf(0.272 * R + 0.534 * G + 0.131 * B);
            newBlue = (newBlue <= 255) ? newBlue : 255;

            int newGreen = roundf(0.349 * R + 0.686 * G + 0.168 * B);
            newGreen = (newGreen <= 255) ? newGreen : 255;

            image[i][j].rgbtRed = newRed;
            image[i][j].rgbtBlue = newBlue;
            image[i][j].rgbtGreen = newGreen;
        }
    }
    return;
}

// Reflect image horizontally
void reflect(int height, int width, RGBTRIPLE image[height][width])
{
    for (int i = 0; i < height; i++)
    {
        for (int j = 0; j < width / 2; j++)
        {
            RGBTRIPLE *left = &image[i][j];
            RGBTRIPLE *right = &image[i][width - 1 - j];
            RGBTRIPLE temp = image[i][j];

            *left = *right;
            *right = temp;
        }
    }
    return;
}

// Blur image
void blur(int height, int width, RGBTRIPLE image[height][width])
{
    RGBTRIPLE copy[height][width];

    for (int i = 0; i < height; i++)
    {
        for (int j = 0; j < width; j++)
        {
            copy[i][j] = image[i][j];
        }
    }

    for (int i = 0; i < height; i++)
    {
        for (int j = 0; j < width; j++)
        {
            int avgRed = 0;
            int avgGreen = 0;
            int avgBlue = 0;
            int pixels = 0;
            for (int di = -1; di <= 1; di++)
            {
                for (int dj = -1; dj <= 1; dj++)
                {
                    if ((i + di >= 0 && i + di < height) && (j + dj >= 0 && j + dj < width))
                    {
                        avgRed += copy[i + di][j + dj].rgbtRed;
                        avgGreen += copy[i + di][j + dj].rgbtGreen;
                        avgBlue += copy[i + di][j + dj].rgbtBlue;
                        pixels++;
                    }
                }
            }
            avgRed = round((float) avgRed / (float) pixels);
            avgGreen = round((float) avgGreen / (float) pixels);
            avgBlue = round((float) avgBlue / (float) pixels);

            image[i][j].rgbtRed = avgRed;
            image[i][j].rgbtGreen = avgGreen;
            image[i][j].rgbtBlue = avgBlue;
        }
    }
    return;
}
