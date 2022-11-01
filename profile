#!/bin/bash

#Array of conjunctions
conjunctions=("also" "although" "and" "as" "because" "before" "but" "for" "if" "nor" "of" "or" "since" "that" "though" "until" "when" "whenever" "whereas" "which" "while" "yet")

#Count of each individual style-marker
comma=$(grep -o '\,' $1 | wc -l)
compound=$(sed 's/--/ /g' $1 | grep -o "[^ ]*[^ ][-][a-z]*" | wc -l)
contraction=$(sed 's/--/ /g' $1 | grep -o "[A-Za-z]*[^ ]'[-a-rt-z]" | wc -l)
semicolon=$(grep -o ';' $1 | wc -l)
sentences=$(grep -o "[\.\!\?]" $1 | wc -l)
words=$(sed 's/--/ /g' $1 | sed 's/[ ]-[ ]/ /g' | wc -w)
for str in ${conjunctions[@]}; do
    echo $str $(grep -ioP "\b$str\b(?!')(?!-)" $1 | wc -l) >> profile.txt
done

#prints to stdout the profile for specified file
echo comma $comma >> profile.txt
echo compound_word $compound >> profile.txt
echo contraction $contraction >> profile.txt
echo semi_colon $semicolon >> profile.txt
echo sentences $sentences >> profile.txt
echo word $words >> profile.txt
cat profile.txt | sort 
rm profile.txt
