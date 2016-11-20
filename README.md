# Use Googles Syntaxnet pretrained with Swedish model

## How to use:

    echo "Kent gick till torget och fick en Kent-skiva" | docker run -i --rm irony/syntaxnet-swedish > out.txt

Result:

    Input: Kent kopte en Kent-skiva
    Parse:
    en NNP ROOT
    +-- kopte NNP nsubj
    |   +-- Kent NNP nn
    +-- Kent-skiva NNP dobj    


