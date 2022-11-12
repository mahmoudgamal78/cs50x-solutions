#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <cs50.h>

int main(int argc, char *argv[])
{
    if (argc != 2)
    {
        printf("Please provide only 1 command-line argument.\n");
        return 1;
    }

    FILE *inptr = fopen(argv[1], "r");
    FILE *outptr = NULL;

    if (inptr == NULL)
    {
        printf("Can not open %s.", argv[1]);
        return 2;
    }

    int counter = 0;
    int found = 0;

    unsigned char buffer[512];

    while (fread(buffer, 512, 1, inptr) == 1)
    {
        if (buffer[0] == 0xff && buffer[1] == 0xd8 && buffer[2] == 0xff
        && (buffer[3] & 0xf0) == 0xe0)
        {
            if (found == 1)
                fclose(outptr);
            else
                found = 1;

            char naming[8];
            sprintf(naming, "%03d.jpg", counter);
            outptr = fopen(naming, "a");
            counter++;
        }

        if (found == 1)
            fwrite(&buffer, 512, 1, outptr);
    }

    fclose(inptr);
    fclose(outptr);
    return 0;
}
