#ifndef CHECKER_H
#define CHECKER_H

#include "../libft/libft.h"

typedef struct s_stack
{
	int				content;
	int				index;
	int				push_cost;
	int				above_median;
	int				cheapest;
	struct s_stack	*target;
	struct s_stack	*next;
	struct s_stack	*prev;
} 					t_stack;

//**********/
// FREE_ERRORS
void free_list(t_stack **stack);
void free_tab(char ***tab);
void ft_error(void);
void handle_error(t_stack **a, char ***numbers);

//**********/
// INIT
void init_with_split(char ***argv, t_stack **a);
void init_without_split(char ***argv, t_stack **a);

//**********/
//	PS_FUNCTIONS
void create_list(char **tab, t_stack **stack);
void ps_lstadd_back(t_stack **stack, t_stack *new);
t_stack	*ps_lstlast(t_stack *stack);
t_stack	*ps_lstnew(char *content);

//**********/
// PARSING
int check_for_occurrence(t_stack *stack);
int is_int(char **tab);
int tab_is_digit(char **tab);

//**********/
//	PS_FUNCTIONS
void pa(t_stack **a, t_stack **b, int print);
void pb(t_stack **b, t_stack **a, int print);
void ra(t_stack **a, int print);
void rb(t_stack **b, int print);
void rr(t_stack **a, t_stack **b, int print);
void rra(t_stack **a, int print);
void rrb(t_stack **b, int print);
void rrr(t_stack **a, t_stack **b, int print);
void sa(t_stack **a, int print);
void sb(t_stack **b, int print);

//**********/
//	UTILS
int count_stack(t_stack *stack);
int ft_strcmp(char *s1, char *s2);
int is_sorted(t_stack *stack);

#endif