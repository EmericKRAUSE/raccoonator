#include "../../include/checker.h"

void	sb(t_stack **b, int print)
{
	t_stack	*first;
	t_stack	*second;

	if (count_stack(*b) < 2)
		return ;
	first = *b;
	second = (*b)->next;
	first->next = second->next;
	first->prev = second;
	second->next = first;
	second->prev = NULL;
	if (first->next != NULL)
		first->next->prev = first;
	*b = second;
	if (print)
		ft_putendl_fd("sb", 1);
}
