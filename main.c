#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int     ft_strcmp(const char *s1, const char *s2);
size_t  ft_strlen(const char *str);
char    *ft_strcpy(char *dest, const char *src);
char    *ft_strdup(const char *s); // <- ajout

int main() {

    char buffer[100];
    char *res;

    printf("----strlen----\n");
    printf("%zu\n", ft_strlen("hello world"));
    printf("%zu\n", ft_strlen(""));
    printf("%zu\n", ft_strlen("42"));

    printf("\n----ft_strcpy----\n");
    printf("%s\n", ft_strcpy(buffer, "hello world"));
    printf("%s\n", ft_strcpy(buffer, ""));
    printf("%s\n", ft_strcpy(buffer, "42"));

    printf("\n----ft_strcmp----\n");
    printf("%d\n", ft_strcmp("a", "z"));      // < 0
    printf("%d\n", ft_strcmp("z", "a"));      // > 0
    printf("%d\n", ft_strcmp("abc", "abc"));  // == 0

    printf("\n----ft_strdup----\n");

    res = ft_strdup("hello world");
    printf("%s\n", res);
    free(res);

    res = ft_strdup("");
    printf("\"%s\"\n", res);
    free(res);

    res = ft_strdup("42");
    printf("%s\n", res);
    free(res);

    res = ft_strdup(NULL); // tester la gestion du NULL si tu l’as codée
    if (res == NULL)
        printf("NULL (correct)\n");
    else {
        printf("%s (mauvais comportement)\n", res);
        free(res);
    }

    return 0;
}
