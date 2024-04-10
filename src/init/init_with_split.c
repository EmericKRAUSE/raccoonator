#include "../../include/checker.h"

void	init_with_split(char ***argv, t_stack **a)
{
	char	**numbers;

	numbers = ft_split((*argv)[1], ' ');
	if (!tab_is_digit(numbers) || !is_int(numbers))
		handle_error(a, &numbers);
	create_list(numbers, a);
	if (check_for_occurrence(*a))
		handle_error(a, &numbers);
	free_tab(&numbers);
}
