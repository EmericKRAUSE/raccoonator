#include "../../include/checker.h"

int count_stack(t_stack *stack)
{
	int i;

	if (!stack)
		return (0);
	i = 0;
	while (stack)
	{
		i++;
		stack = stack->next;
	}
	return (i);
}
