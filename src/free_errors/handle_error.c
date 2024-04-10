#include "../../include/checker.h"

void	handle_error(t_stack **a, char ***numbers)
{
	free_list(a);
	if (numbers && *numbers)
		free_tab(numbers);
	ft_error();
}
