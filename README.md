# Use Googles Syntaxnet pretrained with Swedish model

## How to use:

    echo "Kent gick till torget och fick en Kent-skiva" | docker run -i --rm irony/syntaxnet-swedish > out.txt

Result:

    Input: Kent gick till torget och fick en Kent-skiva
    Parse:
    gick NN ROOT
    +-- Kent NNP nn
    +-- till IN prep
        +-- fick NN pobj
            +-- torget NN nn
            +-- och NN nn
            +-- en IN prep
                +-- Kent-skiva NNP pobj
