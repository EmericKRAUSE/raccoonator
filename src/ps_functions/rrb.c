#include "../../include/checker.h"

void	rrb(t_stack **b, int print)
{
	t_stack	*last;

	if (count_stack(*b) < 2)
		return ;
	last = ps_lstlast(*b);
	last->prev->next = NULL;
	last->prev = NULL;
	last->next = *b;
	(*b)->prev = last;
	*b = last;
	if (print)
		ft_putendl_fd("rrb", 1);
}
