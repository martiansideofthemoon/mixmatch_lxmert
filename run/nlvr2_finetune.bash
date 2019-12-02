# The name of this experiment.
name=$2

# Save logs and models under snap/nlvr2; Make backup.
output=snap/nlvr2/$name
mkdir -p $output/src
cp -r src/* $output/src/
cp $0 $output/run.bash

# See run/Readme.md for option deta
PYTHONPATH=$PYTHONPATH:./src \
    python src/tasks/nlvr2.py \
    --train train --valid valid \
    --llayers 9 --xlayers 5 --rlayers 5 \
    --loadLXMERT snap/pretrained/model \
    --batchSize 24 --optim bert --lr 5e-5 --epochs 10 \
    --tqdm --output $output ${@:3}

