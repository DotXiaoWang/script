#!/bin/bash
is_digit(){
	read -p "please input a number:" NUM
	[[ $NUM =~ ^[1-9][0-9]*$ ]]|| { echo "INPUT FALSE";exit;  }

}
is_digit
echo num=$NUM
 
