PORTB = $6000
PORTA = $6001
DDRB = $6002
DDRA = $6003

E =  %10000000
RW = %01000000
RS = %00100000

  .org $8000

reset:
  lda #%11111111 ; Set all pins on Port B to output
  sta DDRB

  lda #%11100000 ; Set top 3 pins on Port A to output
  sta DDRA

  ; Start STEP 2
  lda #%00111000 ; Set 8-bit mode; 2-line display; 5x8 font
  sta PORTB

  lda #0 ; Clear RS/RW/E bits
  sta PORTA 

  lda #E ; Set E bit to send instruction; Enable pins
  sta PORTA 

  lda #0 ; Clear RS/RW/E bits
  sta PORTA
  ; End STEP 2

  ; Start STEP 3
  lda #%00001110 ; Display on; cursor on, blink off
  sta PORTB

  lda #0 ; Clear RS/RW/E bits
  sta PORTA 

  lda #E ; Set E bit to send instruction; Enable pins
  sta PORTA 

  lda #0 ; Clear RS/RW/E bits
  sta PORTA
  ; End STEP 3

  ; Start STEP 4
  lda #%00000110 ; Increment and shift cursor; don't shift display
  sta PORTB

  lda #0 ; Clear RS/RW/E bits
  sta PORTA 

  lda #E ; Set E bit to send instruction; Enable pins
  sta PORTA 

  lda #0 ; Clear RS/RW/E bits
  sta PORTA
  ; End STEP 4

  ; Start STEP H; Start of HELLO WORLD
  lda #"H"
  sta PORTB
  lda #RS ; Clear RW/E bits
  sta PORTA 
  lda #(RS | E) ; Set E bit to send instruction; Enable Register Select
  sta PORTA 
  lda #RS ; Clear RW/E bits
  sta PORTA
  ; End STEP H

  ; Start STEP E; Start of HELLO WORLD
  lda #"e"
  sta PORTB
  lda #RS ; Clear RW/E bits
  sta PORTA 
  lda #(RS | E) ; Set E bit to send instruction; Enable Register Select
  sta PORTA 
  lda #RS ; Clear RW/E bits
  sta PORTA
  ; End STEP E

  ; Start STEP L; Start of HELLO WORLD
  lda #"l"
  sta PORTB
  lda #RS ; Clear RW/E bits
  sta PORTA 
  lda #(RS | E) ; Set E bit to send instruction; Enable Register Select
  sta PORTA 
  lda #RS ; Clear RW/E bits
  sta PORTA
  ; End STEP L

  ; Start STEP L; Start of HELLO WORLD
  lda #"l"
  sta PORTB
  lda #RS ; Clear RW/E bits
  sta PORTA 
  lda #(RS | E) ; Set E bit to send instruction; Enable Register Select
  sta PORTA 
  lda #RS ; Clear RW/E bits
  sta PORTA
  ; End STEP L

  ; Start STEP O; Start of HELLO WORLD
  lda #"o"
  sta PORTB
  lda #RS ; Clear RW/E bits
  sta PORTA 
  lda #(RS | E) ; Set E bit to send instruction; Enable Register Select
  sta PORTA 
  lda #RS ; Clear RW/E bits
  sta PORTA
  ; End STEP O

  ; Start STEP ,; Start of HELLO WORLD
  lda #","
  sta PORTB
  lda #RS ; Clear RW/E bits
  sta PORTA 
  lda #(RS | E) ; Set E bit to send instruction; Enable Register Select
  sta PORTA 
  lda #RS ; Clear RW/E bits
  sta PORTA
  ; End STEP ,

  ; Start STEP <SPACE>; Start of HELLO WORLD
  lda #" "
  sta PORTB
  lda #RS ; Clear RW/E bits
  sta PORTA 
  lda #(RS | E) ; Set E bit to send instruction; Enable Register Select
  sta PORTA 
  lda #RS ; Clear RW/E bits
  sta PORTA
  ; End STEP <SPACE>

  ; Start STEP W; Start of HELLO WORLD
  lda #"W"
  sta PORTB
  lda #RS ; Clear RW/E bits
  sta PORTA 
  lda #(RS | E) ; Set E bit to send instruction; Enable Register Select
  sta PORTA 
  lda #RS ; Clear RW/E bits
  sta PORTA
  ; End STEP W

  ; Start STEP O; Start of HELLO WORLD
  lda #"o"
  sta PORTB
  lda #RS ; Clear RW/E bits
  sta PORTA 
  lda #(RS | E) ; Set E bit to send instruction; Enable Register Select
  sta PORTA 
  lda #RS ; Clear RW/E bits
  sta PORTA
  ; End STEP O

  ; Start STEP R; Start of HELLO WORLD
  lda #"r"
  sta PORTB
  lda #RS ; Clear RW/E bits
  sta PORTA 
  lda #(RS | E) ; Set E bit to send instruction; Enable Register Select
  sta PORTA 
  lda #RS ; Clear RW/E bits
  sta PORTA
  ; End STEP R

  ; Start STEP L; Start of HELLO WORLD
  lda #"l"
  sta PORTB
  lda #RS ; Clear RW/E bits
  sta PORTA 
  lda #(RS | E) ; Set E bit to send instruction; Enable Register Select
  sta PORTA 
  lda #RS ; Clear RW/E bits
  sta PORTA
  ; End STEP L

  ; Start STEP D; Start of HELLO WORLD
  lda #"d"
  sta PORTB
  lda #RS ; Clear RW/E bits
  sta PORTA 
  lda #(RS | E) ; Set E bit to send instruction; Enable Register Select
  sta PORTA 
  lda #RS ; Clear RW/E bits
  sta PORTA
  ; End STEP D

  ; Start STEP !; Start of HELLO WORLD
  lda #"!"
  sta PORTB
  lda #RS ; Clear RW/E bits
  sta PORTA 
  lda #(RS | E) ; Set E bit to send instruction; Enable Register Select
  sta PORTA 
  lda #RS ; Clear RW/E bits
  sta PORTA
  ; End STEP !
  
loop:
  jmp loop

  .org $fffc
  .word reset
  .word $0000