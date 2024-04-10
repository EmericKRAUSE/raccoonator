#include "../../include/checker.h"

void	pa(t_stack **a, t_stack **b, int print)
{
	t_stack	*temp;

	if (!*b)
		return ;
	temp = *b;
	*b = (*b)->next;
	if (*b)
		(*b)->prev = NULL;
	if (!*a)
	{
		*a = temp;
		temp->next = NULL;
	}
	else
	{
		temp->next = *a;
		(*a)->prev = temp;
		*a = temp;
	}
	if (print)
		ft_putendl_fd("pa", 1);
}
