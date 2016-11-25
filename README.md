# Use Googles Syntaxnet pretrained with Swedish model

## How to use:
    echo "Jag vill byta abonnemang till mer data imorgon" | docker run -i --rm irony/syntaxnet-swedish > out.txt
    cat out.txt

Result:

    Input: Jag vill byta abonnemang till mer data imorgon
    Parse:
    vill NN ROOT
    +-- Jag NNP nsubj
    +-- abonnemang NNP dobj
    |   +-- byta NNP nn
    +-- till IN prep
        +-- imorgon NN pobj
            +-- mer NN amod
            +-- fron NN nn
            |   +-- data NNS nn
            +-- och NN amod
            +-- med VBN amod

## To switch language
Just look at the dockerfile and replace Swedish to any of the supported languages. 