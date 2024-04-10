#include "../../include/checker.h"

void	ps_lstadd_back(t_stack **stack, t_stack *new)
{
	t_stack	*last;

	if (stack != NULL && new != NULL)
	{
		if (*stack == NULL)
			*stack = new;
		else
		{
			last = ps_lstlast(*stack);
			last->next = new;
			new->prev = last;
		}
	}
}
