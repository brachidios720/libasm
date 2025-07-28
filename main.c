#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <errno.h>

int     ft_strcmp(const char *s1, const char *s2);
size_t  ft_strlen(const char *str);
char    *ft_strcpy(char *dest, const char *src);
char    *ft_strdup(const char *s); 
ssize_t ft_read(int fd, void *buf, size_t count);
ssize_t ft_write(int fd, const void *buf, size_t count);

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

    res = ft_strdup(NULL); // tester la gestion du NULL 
    if (res == NULL)
        printf("NULL (correct)\n");
    else {
        printf("%s (mauvais comportement)\n", res);
        free(res);
    }

        printf("\n----ft_write----\n");
    ssize_t w = ft_write(1, "hello from ft_write!\n", 22);
    printf("ret: %zd\n", w);
    if (w == -1)
        perror("ft_write");

    printf("\n----ft_read----\n");
    char buf[100];
    write(1, "Tapez quelque chose : ", 23);
    ssize_t r = ft_read(0, buf, 99);
    if (r == -1)
        perror("ft_read");
    else
    {
        buf[r] = '\0'; 
        printf("lu : %s\n", buf);
        printf("ret: %zd\n", r);
    }


    return 0;
}
