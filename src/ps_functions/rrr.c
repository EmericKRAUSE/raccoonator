#include "../../include/checker.h"

void	rrr(t_stack **a, t_stack **b, int print)
{
	rra(a, 0);
	rrb(b, 0);
	if (print)
		ft_putendl_fd("rrr", 1);
}
