#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[])
{
    if (argc != 2)
    {
        printf("Usage: ./recover FILE\n");
        return 1;
    }

    FILE *card = fopen(argv[1], "r");
    if (card == NULL)
    {
        printf("Cannot open file.\n");
        return 2;
    }

    uint8_t buffer[512];
    bool found = false;
    int counter = 0;
    FILE *img = NULL;
    char filename[8];

    while (fread(buffer, 1, 512, card) == 512)
    {
        if (buffer[0] == 0xff && buffer[1] == 0xd8 && buffer[2] == 0xff &&
            (buffer[3] & 0xf0) == 0xe0)
        {
            if (found && img != NULL)
            {
                fclose(img);
            }

            sprintf(filename, "%03i.jpg", counter++);
            img = fopen(filename, "w");
            if (img == NULL)
            {
                fclose(card);
                fprintf(stderr, "Could not create file %s\n", filename);
                return 3;
            }

            found = true;
        }

        if (found)
        {
            fwrite(buffer, 1, 512, img);
        }
    }

    fclose(card);
    if (img != NULL)
    {
        fclose(img);
    }

    return 0;
}
