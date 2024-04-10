#include "../include/checker.h"

static char *read_instruction(void)
{
	int readed;
	char *temp;
	char buf[2];

	readed = 1;
	temp = ft_strdup("");
	if (!temp)
		return (NULL);
	while (readed > 0)
	{
		readed = read(0, buf, 1);
		if (readed > 0)
		{
			buf[1] = '\0';
			temp = ft_strjoin(temp, buf);
			if (!temp)
			{
				free(temp);
				return (NULL);
			}
		}
	}
	return (temp);
}

static char **get_tab(void)
{
	char **tab;
	char *str;

	str = read_instruction();
	tab = ft_split(str, '\n');
	free(str);
	return (tab);
}

static void check_instruction(char **tab, t_stack **a, t_stack **b, int i)
{
	if (!ft_strcmp(tab[i], "rra"))
		rra(a, 0);
	else if (!ft_strcmp(tab[i], "rrb"))
		rrb(b, 0);
	else if (!ft_strcmp(tab[i], "rrr"))
		rrr(a, b, 0);
	else if (!ft_strcmp(tab[i], "pa"))
		pa(a, b, 0);
	else if (!ft_strcmp(tab[i], "pb"))
		pb(b, a, 0);
	else if (!ft_strcmp(tab[i], "ra"))
		ra(a, 0);
	else if (!ft_strcmp(tab[i], "rb"))
		rb(b, 0);
	else if (!ft_strcmp(tab[i], "rr"))
		rr(a, b, 0);
	else if (!ft_strcmp(tab[i], "sa"))
		sa(a, 0);
	else if (!ft_strcmp(tab[i], "sb"))
		sb(b, 0);
	else
		handle_error(a, &tab);
}

static void execute_instruction(char **tab, t_stack **a, t_stack **b)
{
	int i;

	i = 0;
	while (tab[i])
	{
		check_instruction(tab, a, b, i);
		i++;
	}
}

int main(int argc, char **argv)
{
	t_stack *a;
	t_stack *b;
	char **tab;

	a = NULL;
	b = NULL;
	if (argc == 1 || (argc == 2 && !argv[1][0]))
		return (1);
	else if (argc == 2)
		init_with_split(&argv, &a);
	else if (argc > 2)
		init_without_split(&argv, &a);
	tab = get_tab();
	execute_instruction(tab, &a, &b);
	if (is_sorted(a))
		ft_putendl_fd("OK", 1);
	else
		ft_putendl_fd("KO", 1);
	free_tab(&tab);
	free_list(&a);
	return (0);
}
