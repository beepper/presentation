
data segment           
    ;1.1
    val1    DB  10
    val2    DB  27
    val3    DB  10010101b
    ;1.2
    rsum    DB  0
    rsub    DB  0
    rmul    DW  1   
    rquot   DB  ?
    rrem    DB  ?
ends

stack segment
    
ends

code segment

    MOV ax, data
    MOV ds, ax
    
    ;1.3
    XOR ax, ax   ;AX = AH | AL
    MOV al, val1
    ADD al, val2
    MOV rsum, al
    
    ;1.4          
    XOR ax, ax   
    MOV al, val1
    SUB al, val2
    MOV rsub, al
    
    ;1.5
    XOR ax, ax   
    MOV al, val1
    MOV BL, val2
    NOT BL
    ADD BL, 1
    SUB al, BL
    
    ;1.6.1
    xor ax, ax   
    MOV al, val1
    MOV BL, val2
    NOT BL
    ADD BL, 1
    IMUL BL
    MOV rmul, AX
    
    ;1.6.2
    xor ax, ax   
    MOV al, val1
    MOV BL, val2
    NOT BL
    ADD BL, 1
    MUL BL
    MOV rmul, AX
    
    ;1.7
    XOR AX, AX   
    MOV AL, val2
    DIV val1
    MOV rquot, AL
    MOV rrem, AH
       
    ;1.8
    MOV AL, rquot
    OR AL, 10000001b
    NOT AL
    AND AL, 10110110b
    
    ;1.9
    MOV BL, AL
    XOR AL, BL
    
    MOV AX, 4C00h
    INT 21h    

ends


