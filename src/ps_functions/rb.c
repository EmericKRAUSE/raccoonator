#include "../../include/checker.h"

void	rb(t_stack **b, int print)
{
	t_stack	*first;
	t_stack	*last;

	if (count_stack(*b) < 2)
		return ;
	first = *b;
	last = ps_lstlast(*b);
	*b = (*b)->next;
	(*b)->prev = NULL;
	first->next = NULL;
	first->prev = last;
	last->next = first;
	if (print)
		ft_putendl_fd("rb", 1);
}
