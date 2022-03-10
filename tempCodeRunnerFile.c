#include <stdio.h>

int main()
{
    char code[1000];
    int i=0, a=0, b=0,c=0;
    
    printf("Enter the code");
    scanf("%s",&code);
    
    while(code[i]!= '\0')  
    {  
         
     if(code[i]=='(')  
        {  
            a++;     
        }  
        
     else if(code[i]==')')  
        {  
            a--;     
            if(a<0)  
            break;  
        }
     else if(code[i]=='{'){
            b++;
        }
        
     else if(code[i]=='}'){
            b--;     
            if(b<0)  
            break; 
       }
       
     else if(code[i]=='['){
           c++; 
       }
       
     else if(code[i]==']'){
           c--;     
            if(c<0)  
            break;
       }
    i++;       
    }  
      
    if(a==0 && b==0 && c==0)  
    {  
        printf("1");  
    }
      
    else  
    {  
        printf("0");  
    }
    return 0;
}