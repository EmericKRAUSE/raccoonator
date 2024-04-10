#include "../../include/checker.h"

void	create_list(char **tab, t_stack **stack)
{
	t_stack	*node;
	int		i;

	i = 0;
	while (tab[i])
	{
		node = ps_lstnew(tab[i]);
		ps_lstadd_back(stack, node);
		i++;
	}
}
