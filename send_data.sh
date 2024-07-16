#!/bin/bash

rand_number_generator(){
    min=3;max=6
    RAND=$(awk "BEGIN{srand(); print int(rand()*($max-$min+1))+$min}")
}

set_timestamp_lag(){
    EPOCH=$(date -v -10S +%s)
    TIMESTAMP=$(date -v -10S)
}

set_timestamp(){
    EPOCH=$(date +%s)
    TIMESTAMP=$(date)
}

send_datapoint(){
    /usr/bin/curl -X POST "https://ingest.signalfx.com/v2/datapoint" \
        -H "Content-Type: application/json" \
        -H "X-SF-Token: <REDACTED>" \
        -d '{
                "gauge": [
                    {
                        "metric": "megasoreass",
                        "value": '$RAND',
                        "dimensions": {
                            "service": "hurts"
                        },
                        "timestamp": "$EPOCH"
                    }
                ]
            }'
}

count=1
while [[ $count -le 3 ]]
    do
        if [[ $count -eq 2 ]]
            then
                set_timestamp_lag
            else
                set_timestamp
            fi

        rand_number_generator
        echo -n 'count:' $count ' RAND:' $RAND ' EPOCH:' $EPOCH ' TIMESTAMP:' $TIMESTAMP ' response: '
        send_datapoint;echo
        sleep 1
        count=$((count+1))
    done
