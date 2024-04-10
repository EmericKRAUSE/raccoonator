#include "../../include/checker.h"

void	rra(t_stack **a, int print)
{
	t_stack	*last;

	if (count_stack(*a) < 2)
		return ;
	last = ps_lstlast(*a);
	last->prev->next = NULL;
	last->prev = NULL;
	last->next = *a;
	(*a)->prev = last;
	*a = last;
	if (print)
		ft_putendl_fd("rra", 1);
}
