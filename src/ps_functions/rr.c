#include "../../include/checker.h"

void	rr(t_stack **a, t_stack **b, int print)
{
	ra(a, 0);
	rb(b, 0);
	if (print)
		ft_putendl_fd("rr", 1);
}
