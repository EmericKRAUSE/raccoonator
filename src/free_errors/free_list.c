#include "../../include/checker.h"

void	free_list(t_stack **stack)
{
	t_stack	*previous;

	while (*stack)
	{
		previous = *stack;
		*stack = (*stack)->next;
		free (previous);
	}
}
