import base64
from urllib.parse import unquote

new_file = open('logs_cleaned_no_spaces_no_sql.log', 'w')
with open('10.9.4.20_access.log', 'r') as file:
    for line in file:
        new_line = line.split(" ")
        decoded_str = base64.b64decode(new_line[-1]).decode('UTF-8')
        if " " not in decoded_str or "sqlmap" in decoded_str:
            continue
        
        new_line[-1] = f"\"{decoded_str}\""
        url = unquote(new_line[6])
        new_line[6] = url

        #print(url)
        out = " ".join(new_line)
        #print(out)
    
        new_file.write(f"{out}\n")

new_file.close()