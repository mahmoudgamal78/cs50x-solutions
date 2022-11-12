#include "helpers.h"
#include "math.h"
#include "stdlib.h"
#include "stdio.h"
#include "string.h"
#include "cs50.h"

int resolveSepiaValue(float value);

// Convert image to grayscale
void grayscale(int height, int width, RGBTRIPLE image[height][width])
{
    for (int i = 0; i < height; i++)
    {
        for (int j = 0; j < width; j++)
        {
            RGBTRIPLE pixel = image[i][j];

            double colorSum = pixel.rgbtRed + pixel.rgbtBlue + pixel.rgbtGreen;

            if (colorSum > 0)
            {
                double averageGreyColor = colorSum / 3;

                int greyColor = round(averageGreyColor);

                image[i][j].rgbtRed = greyColor;
                image[i][j].rgbtBlue = greyColor;
                image[i][j].rgbtGreen = greyColor;
            }
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
            RGBTRIPLE pixel = image[i][j];

            float _sepiaRed = (.393 * pixel.rgbtRed) + (.769 * pixel.rgbtGreen) + (.189 * pixel.rgbtBlue);
            int sepiaRed = resolveSepiaValue(_sepiaRed);

            float _sepiaGreen = (.349 * pixel.rgbtRed) + (.686 * pixel.rgbtGreen) + (.168 * pixel.rgbtBlue);
            int sepiaGreen = resolveSepiaValue(_sepiaGreen);

            float _sepiaBlue = (.272 * pixel.rgbtRed) + (.534 * pixel.rgbtGreen) + (.131 * pixel.rgbtBlue);
            int sepiaBlue = resolveSepiaValue(_sepiaBlue);

            image[i][j].rgbtRed = sepiaRed;
            image[i][j].rgbtBlue = sepiaBlue;
            image[i][j].rgbtGreen = sepiaGreen;
        }
    }

    return;
}

// Reflect image horizontally
void reflect(int height, int width, RGBTRIPLE image[height][width])
{
    RGBTRIPLE copy[height][width];

    for (int i = 0; i < height; i++)
    {
        for (int j = 0; j < width; j++)
        {
            copy[i][j].rgbtRed = image[i][j].rgbtRed;
            copy[i][j].rgbtBlue = image[i][j].rgbtBlue;
            copy[i][j].rgbtGreen = image[i][j].rgbtGreen;
        }
    }

    int widthRange = width - 1;

    for (int i = 0; i < height; i++)
    {
        for (int j = 0; j < width; j++)
        {
            image[i][j].rgbtRed = copy[i][widthRange - j].rgbtRed;
            image[i][j].rgbtBlue = copy[i][widthRange - j].rgbtBlue;
            image[i][j].rgbtGreen = copy[i][widthRange - j].rgbtGreen;
        }
    }

    return;
}

// Blur image
void blur(int height, int width, RGBTRIPLE image[height][width])
{
    RGBTRIPLE output[height][width];

    memcpy(output, image, sizeof(RGBTRIPLE) * height * width);

    for (int row = 0; row < width; row++)
    {
        for (int column = 0; column < height; column++)
        {
            int siblingCount = 0;

            int red = 0;
            int green = 0;
            int blue = 0;

            for (int x = row - 1; x <= row + 1; x++)
            {
                if (x >= 0 && x < width)
                {
                    for (int y = column - 1; y <= column + 1; y++)
                    {
                        if (y >= 0 && y < height)
                        {
                            RGBTRIPLE pixel = output[y][x];

                            red += pixel.rgbtRed;
                            green += pixel.rgbtGreen;
                            blue += pixel.rgbtBlue;

                            siblingCount++;
                        }
                    }
                }

            }

            image[column][row].rgbtRed = round((float)red / siblingCount);
            image[column][row].rgbtGreen = round((float)green / siblingCount);
            image[column][row].rgbtBlue = round((float)blue / siblingCount);
        }
    }

    return;
}

// Gets the apropriate sepia value
int resolveSepiaValue(float value)
{
    int _sepia = round(value);

    if (_sepia > 255)
    {
        _sepia = 255;
    }

    return _sepia;
}