# nagios-check_numeral_value_in_file



This is a Nagios Plugin.  
This checker script reads first line of file and get numeral value. And then it compare numbers.

# Usage

```
cat /tmp/application.txt
=> 350

ruby check_numeral_value_in_file.rb -f /tmp/application.txt -w 100 -c 200 --bigger
=> CRITICAL - 350 is bigger than threshold vale of 200.|num=350

ruby check_numeral_value_in_file.rb -f /tmp/application.txt -w 400 -c 300 --smaller
=> WARNING - 350 is smaller than threshold vale of 400.|num=350
```


# Author

Takeshi Yako
