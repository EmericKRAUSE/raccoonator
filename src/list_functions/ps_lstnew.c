#include "../../include/checker.h"

t_stack	*ps_lstnew(char *content)
{
	t_stack	*elem;

	elem = malloc(sizeof(t_stack));
	if (!elem)
		return (NULL);
	elem->content = ft_atoi(content);
	elem->index = -1;
	elem->next = NULL;
	elem->prev = NULL;
	return (elem);
}
