%{
	#include<stdio.h>
	#include<stdlib.h>	
	#include<string.h>

	struct node{

		char name[10];
		struct node *left;
		struct node *right;
	};

	struct node *root;
	struct node* create(char *token, struct node *left, struct node *right);
	void preorder(struct node *root);
	void inorder(struct node *root);
	void postorder(struct node *root);
%}

%union{

	char str[10];
	struct node *p;
}

%token <str>ID
%type <p>E
%left '+' '-'
%left '*' '/'
%nonassoc UNIMINUS
%%

S:E		{ root = $1; }
 ;
E:E'+'E		{ $$ = create("+",$1,$3); }
 |E'-'E		{ $$ = create("-",$1,$3); }
 |E'*'E		{ $$ = create("*",$1,$3); }
 |E'/'E		{ $$ = create("/",$1,$3); }
 |'-'E %prec UNIMINUS	{ $$ = create("-",NULL,$2); }
 |ID		{ $$ = create($1,NULL,NULL); }
 ;

%%

main(){

	yyparse();

	printf("Preorder : \n");
	preorder(root);
	printf("\n");

	printf("Inorder : \n");
	inorder(root);
	printf("\n");

	printf("Postorder : \n");
	postorder(root);
	printf("\n");

}

int yyerror(){

	return 1;
}

struct node* create(char *token, struct node *left, struct node *right){

	struct node *temp_node;
	temp_node = (struct node*) malloc(sizeof(struct node));

	if(temp_node!=NULL){

		strcpy(temp_node->name,token);
		temp_node->left = left;
		temp_node->right = right;
	}

	return temp_node;
}

void preorder(struct node *root){

	if(root){

		printf("%s",root->name);
		preorder(root->left);
		preorder(root->right);
	}

}

void inorder(struct node *root){

	if(root){

		inorder(root->left);
		printf("%s",root->name);
		inorder(root->right);
	}

}

void postorder(struct node *root){

	if(root){

		postorder(root->left);
		postorder(root->right);
		printf("%s",root->name);
	}

}
