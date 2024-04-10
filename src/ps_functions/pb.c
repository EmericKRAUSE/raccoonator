#include "../../include/checker.h"

void	pb(t_stack **b, t_stack **a, int print)
{
	t_stack	*temp;

	if (!*a)
		return ;
	temp = *a;
	*a = (*a)->next;
	if (*a)
		(*a)->prev = NULL;
	if (!*b)
	{
		*b = temp;
		temp->next = NULL;
	}
	else
	{
		temp->next = *b;
		(*b)->prev = temp;
		*b = temp;
	}
	if (print)
		ft_putendl_fd("pb", 1);
}
