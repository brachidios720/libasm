#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <errno.h>

typedef struct s_list
{
    void *data;
    struct s_list *next;
} t_list;

int     ft_strcmp(const char *s1, const char *s2);
size_t  ft_strlen(const char *str);
char    *ft_strcpy(char *dest, const char *src);
char    *ft_strdup(const char *s); 
ssize_t ft_read(int fd, void *buf, size_t count);
ssize_t ft_write(int fd, const void *buf, size_t count);
int	    ft_list_size(t_list *begin_list);
void    ft_list_sort(t_list **begin_list, int (*cmp)());
void    ft_list_push_front(t_list **begin_list, void *data);
t_list  *ft_lst_new(void *data);
void    ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)(), void (*free_fct)(void *));


int		cmp_str(char *a, char *b)
{
	return (strcmp(a, b));
}

t_list *create_elem(char *data)
{
	t_list *node = malloc(sizeof(t_list));
	node->data = data;
	node->next = NULL;
	return node;
}

void print_list(t_list *lst)
{
	while (lst)
	{
		printf("%s -> ", (char *)lst->data);
		lst = lst->next;
	}
	printf("NULL\n");
}

int main(void)
{
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

    printf("\n----ft_list_size----\n");
    // 🧩 1️⃣ Liste vide
    t_list *empty = NULL;
    printf("Test 1 (liste vide)        → %d\n", ft_list_size(empty)); // attendu: 0

    // 🧩 2️⃣ Liste avec 1 seul élément
    t_list node1 = { "Hello", NULL };
    printf("Test 2 (1 élément)         → %d\n", ft_list_size(&node1)); // attendu: 1

    // 🧩 3️⃣ Liste avec 2 éléments
    t_list node2 = { "World", &node1 };
    printf("Test 3 (2 éléments)        → %d\n", ft_list_size(&node2)); // attendu: 2

    // 🧩 4️⃣ Liste avec 3 éléments
    t_list node3 = { "Libasm", &node2 };
    printf("Test 4 (3 éléments)        → %d\n", ft_list_size(&node3)); // attendu: 3

    // 🧩 5️⃣ Liste créée dynamiquement
    t_list *x = malloc(sizeof(t_list));
    t_list *y = malloc(sizeof(t_list));
    t_list *z = malloc(sizeof(t_list));
    x->data = "A"; x->next = y;
    y->data = "B"; y->next = z;
    z->data = "C"; z->next = NULL;
    printf("Test 5 (malloc 3 éléments) → %d\n", ft_list_size(x)); // attendu: 3

    free(x);
    free(y);
    free(z);

    printf("\n----ft_list_sort----\n");
    t_list *n1 = create_elem("z");
	t_list *n2 = create_elem("b");
	t_list *n3 = create_elem("a");
	t_list *n4 = create_elem("c");

	n1->next = n2;
	n2->next = n3;
	n3->next = n4;

	printf("Before sort:\n");
	print_list(n1);

	ft_list_sort(&n1, (int (*)())cmp_str);

	printf("\nAfter sort:\n");
	print_list(n1);


    printf("\n----ft_list_push_front / ft_lst_new----\n");

    t_list *list = NULL; // liste vide au départ

    printf("Liste initiale : ");
    print_list(list); // attendu : NULL

    // Ajout d’un premier élément
    ft_list_push_front(&list, "world");
    printf("Après ajout de 'world' : ");
    print_list(list); // attendu : world -> NULL

    // Ajout d’un deuxième élément
    ft_list_push_front(&list, "hello");
    printf("Après ajout de 'hello' : ");
    print_list(list); // attendu : hello -> world -> NULL

    // Ajout d’un troisième élément
    ft_list_push_front(&list, "42");
    printf("Après ajout de '42' : ");
    print_list(list); // attendu : 42 -> hello -> world -> NULL
    return 0;
}