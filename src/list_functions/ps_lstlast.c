#include "../../include/checker.h"

t_stack	*ps_lstlast(t_stack *stack)
{
	t_stack	*temp;

	temp = NULL;
	if (stack != NULL)
	{
		temp = stack;
		while (temp-> next)
		{
			temp = temp->next;
		}
	}
	return (temp);
}
