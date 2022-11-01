BEGIN{

  array[0] = "Hullo"

  array[1] = "Hullo"

}

 

{for(i=0; i<=2; i++)

  print array[i] " " $1

}
