#!/bin/bash 
#chmod u+x run_all.sh 

#date '+%B %d'
#date '+%B'

date '+%B' > month.txt

if [ -e "./month.txt" ]
then
    _month="$(<./month.txt)"
	folderB=$(echo $_month | tr 'a-z' 'A-Z')
else
    _month=""
	folderB=$(echo $_month | tr 'a-z' 'A-Z')
fi

#echo $folderB

if [ ! -d $folderB ]; then
    mkdir -p $folderB;
	
else
	echo "Directory already exist"

fi;

myfolderA=$(date '+%m-%d-%Y')
if [ ! -d ./$folderB/$myfolderA ]; then
	mkdir -p ./$folderB/$myfolderA;
	
else
	echo "Directory already exist"
fi;

read -p "Enter client name:" client_name  
#echo "The client name: " $client_name

while [[ "${client_name}" == "" ]] ; do
   read -p "Enter client name:" client_name  
   #echo "The client name: " $client_name
  #(( i += 1 ))
done

read -p "Enter task link:" task_link  
#echo "The client name: " $client_name

while [[ "${task_link}" == "" ]] ; do
   read -p "Enter task link:" task_link   
done

read -p "Enter client website:" client_web  
#echo "The website link is: " $client_web

while [[ "${client_web}" == "" ]] ; do
   read -p "Enter client website:" client_web  
   #echo "The website link is: " $client_web
  #(( i += 1 ))
done

if [ ! -d "./$folderB/$myfolderA/$client_web" ]; then

	mkdir -p "./$folderB/$myfolderA/$client_web";
	mkdir -p "./$folderB/$myfolderA/$client_web/bu";
	mkdir -p "./$folderB/$myfolderA/$client_web/screenshot";
	mkdir -p "./$folderB/$myfolderA/$client_web/up";

fi 

client_webA="https://www."$client_web
echo "$client_webA" > ./$folderB/$myfolderA/$client_web/website_link.txt 
echo "start $client_webA" > ./$folderB/$myfolderA/$client_web/client_webA.sh
start ./$folderB/$myfolderA/$client_web/client_webA.sh

#email verification links: 
./verify_email.sh 

read -p "Enter database link:" db_link  
#echo "The database link: " $db_link

while [[ "${db_link}" == "" ]] ; do
   read -p "Enter database link:" db_link  
   #echo "The database link: " $db_link

  #(( i += 1 ))
done

read -p "Enter db username:" db_username 
#echo "The db username: " $db_username

while [[ "${db_username}" == "" ]] ; do
      
   read -p "Enter db username:" db_username 
   #echo "The db username: " $db_username
   
  #(( i += 1 ))
done

read -p "Enter db password:" db_password 
#echo "The db password: " $db_password

while [[ "${db_password}" == "" ]] ; do
   
   read -p "Enter db password:" db_password 
   #echo "The db password: " $db_password

  #(( i += 1 ))
done

read -p "Enter ftp hostname:" ftp_hostname 
#echo "The ftp hostname: " $ftp_hostname

while [[ "${ftp_hostname}" == "" ]] ; do
   
   read -p "Enter ftp hostname:" ftp_hostname 
   #echo "The ftp hostname: " $ftp_hostname

  #(( i += 1 ))
done

read -p "Enter ftp username:" ftp_username 
#echo "The ftp username: " $ftp_username

while [[ "${ftp_username}" == "" ]] ; do
   
   read -p "Enter ftp username:" ftp_username 
   #echo "The ftp username: " $ftp_username

  #(( i += 1 ))
done

read -p "Enter ftp password:" ftp_password 
#echo "The ftp password: " $ftp_password

while [[ "${ftp_password}" == "" ]] ; do
   
   read -p "Enter ftp password:" ftp_password 
   #echo "The ftp password: " $ftp_password

  #(( i += 1 ))
done

client_webB="https://www."$client_web"/?s=[form"
s3_amazon_link="https://console.aws.amazon.com/s3/buckets/proweaver-files"

echo "Client Name: $client_name" >> ./$folderB/$myfolderA/$client_web/$client_web".txt"
echo "task_link=$task_link" >> ./$folderB/$myfolderA/$client_web/$client_web".txt"
echo "website=$client_webA" >> ./$folderB/$myfolderA/$client_web/$client_web".txt"
echo "#==== START DATABASE =====" >> ./$folderB/$myfolderA/$client_web/$client_web".txt"
echo "db_link=$db_link" >> ./$folderB/$myfolderA/$client_web/$client_web".txt"
echo "db_username=$db_username" >> ./$folderB/$myfolderA/$client_web/$client_web".txt"
echo "db_password=$db_password" >> ./$folderB/$myfolderA/$client_web/$client_web".txt"
echo "#==== END DATABASE =====" >> ./$folderB/$myfolderA/$client_web/$client_web".txt"
echo "                     " >> ./$folderB/$myfolderA/$client_web/$client_web".txt"
echo "#==== START FTP =====" >> ./$folderB/$myfolderA/$client_web/$client_web".txt"
echo "ftp_hostname=$ftp_hostname" >> ./$folderB/$myfolderA/$client_web/$client_web".txt"
echo "ftp_username=$ftp_username" >> ./$folderB/$myfolderA/$client_web/$client_web".txt"
echo "ftp_password=$ftp_password" >> ./$folderB/$myfolderA/$client_web/$client_web".txt"
echo "#==== END FTP =====" >> ./$folderB/$myfolderA/$client_web/$client_web".txt"
#run command 
echo "start $client_webB" > ./$folderB/$myfolderA/$client_web/client_webB.sh
echo "start $db_link" > ./$folderB/$myfolderA/$client_web/db_link.sh
#start browser 
start ./$folderB/$myfolderA/$client_web/client_webB.sh
start ./$folderB/$myfolderA/$client_web/db_link.sh

#s3://proweaver-files/TECH/Ideal Home Health Services Inc./version2/October-1-2024-RicoLa/screenshot/

echo "                     " >> ./$folderB/$myfolderA/$client_web/$client_web".txt"
echo "#==== SCREENSHOT FILE PATH =====" >> ./$folderB/$myfolderA/$client_web/$client_web".txt"
echo "scrn_path=$scrn_path_final" >> ./$folderB/$myfolderA/$client_web/$client_web".txt"

#!/bin/bash
# Bash Menu Script Example

PS3='Select form template: '
options=("PDQA Form" "RWC Form" "Form Conversion" "Regular Blog" "Custom Blog" "Regular Testimonial" "Custom Testimonial" "Login" "Upload" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "PDQA Form")
            echo "you chose choice $REPLY which is $opt"
			file_name="pdqa_form.txt"
			#cp ./template/pdqa_form.txt ./$folderB/$myfolderA/$client_web/pdqa_form.txt
			if [ -e "./template/$file_name" ]
			then
				#scrn_txt="$(<./$folderB/$myfolderA/$client_web/scrn.txt)"
				#cp ./template/pdqa_form.txt ./$folderB/$myfolderA/$client_web/$file_name
				cp ./template/$file_name ./$folderB/$myfolderA/$client_web/$file_name
				
			else
				echo "File not found."
			fi
			
			break
            ;;
        "RWC Form")
            echo "you chose choice $REPLY which is $opt"
			file_name="rwc_form.txt"
			if [ -e "./template/$file_name" ]
			then
				#scrn_txt="$(<./$folderB/$myfolderA/$client_web/scrn.txt)"
				cp ./template/$file_name ./$folderB/$myfolderA/$client_web/$file_name
			else
				echo "File not found."
			fi
			break
			
            ;;
        "Form Conversion")
            echo "you chose choice $REPLY which is $opt"
			file_name="form_conversion.txt"
			if [ -e "./template/$file_name" ]
			then
				#scrn_txt="$(<./$folderB/$myfolderA/$client_web/scrn.txt)"
				#cp ./template/form_conversion.txt ./$folderB/$myfolderA/$client_web/form_conversion.txt
				cp ./template/$file_name ./$folderB/$myfolderA/$client_web/$file_name
			else
				echo "File not found."
			fi
			break
			
            ;;
		"Regular Blog")
            echo "you chose choice $REPLY which is $opt"
			file_name="regular_blog.txt"
			if [ -e "./template/$file_name" ]
			then
				#scrn_txt="$(<./$folderB/$myfolderA/$client_web/scrn.txt)"
				#cp ./template/regular_blog.txt ./$folderB/$myfolderA/$client_web/regular_blog.txt
				cp ./template/$file_name ./$folderB/$myfolderA/$client_web/$file_name
			else
				echo "File not found."
			fi
			
			#blog_link
			read -p "Enter Blog link:" blog_link 
			while [[ "${blog_link}" == "" ]] ; do
			   read -p "Enter Blog link:" blog_link 
			done
			start Find_And_Replace.vbs "./$folderB/$myfolderA/$client_web/$file_name" "blog_link" "$blog_link"
			
			#_nickname 
			read -p "Enter nickname:" _nickname 
			while [[ "${_nickname}" == "" ]] ; do
			   read -p "Enter nickname:" _nickname   
			done
			sed -i -e "s/_nickname/${_nickname}/g" ./$folderB/$myfolderA/$client_web/$file_name
			
			break
			
            ;;
		"Custom Blog")
            echo "you chose choice $REPLY which is $opt"
			file_name="custom_blog.txt"
			if [ -e "./template/$file_name" ]
			then
				#scrn_txt="$(<./$folderB/$myfolderA/$client_web/scrn.txt)"
				#cp ./template/custom_blog.txt ./$folderB/$myfolderA/$client_web/custom_blog.txt
				cp ./template/$file_name ./$folderB/$myfolderA/$client_web/$file_name
			else
				echo "File not found."
			fi
			
			#blog_link
			read -p "Enter Blog link:" blog_link 
			while [[ "${blog_link}" == "" ]] ; do
			   read -p "Enter Blog link:" blog_link 
			done
			start Find_And_Replace.vbs "./$folderB/$myfolderA/$client_web/$file_name" "blog_link" "$blog_link"
			
			#_nickname 
			read -p "Enter nickname:" _nickname 
			while [[ "${_nickname}" == "" ]] ; do
			   read -p "Enter nickname:" _nickname   
			done
			sed -i -e "s/_nickname/${_nickname}/g" ./$folderB/$myfolderA/$client_web/$file_name
			
			break
			
            ;;
		"Regular Testimonial")
            echo "you chose choice $REPLY which is $opt"
			file_name="regular_testimonial.txt"
			if [ -e "./template/$file_name" ]
			then
				#scrn_txt="$(<./$folderB/$myfolderA/$client_web/scrn.txt)"
				#cp ./template/regular_testimonial.txt ./$folderB/$myfolderA/$client_web/regular_testimonial.txt
				cp ./template/$file_name ./$folderB/$myfolderA/$client_web/$file_name
			else
				echo "File not found."
			fi
			
			#testimonial_link
			read -p "Enter Testimonial link:" testimonial_link 
			while [[ "${testimonial_link}" == "" ]] ; do
			   read -p "Enter Testimonial link:" testimonial_link 
			done
			start Find_And_Replace.vbs "./$folderB/$myfolderA/$client_web/$file_name" "testimonial_link" "$testimonial_link"
			
			#_nickname 
			read -p "Enter nickname:" _nickname 
			while [[ "${_nickname}" == "" ]] ; do
			   read -p "Enter nickname:" _nickname   
			done
			sed -i -e "s/_nickname/${_nickname}/g" ./$folderB/$myfolderA/$client_web/$file_name
			
			break
			
            ;;
		"Custom Testimonial")
            echo "you chose choice $REPLY which is $opt"
			file_name="custom_testimonial.txt"
			if [ -e "./template/$file_name" ]
			then
				#scrn_txt="$(<./$folderB/$myfolderA/$client_web/scrn.txt)"
				#cp ./template/custom_testimonial.txt ./$folderB/$myfolderA/$client_web/custom_testimonial.txt
				cp ./template/$file_name ./$folderB/$myfolderA/$client_web/$file_name
			else
				echo "File not found."
			fi
			
			#testimonial_link
			read -p "Enter Testimonial link:" testimonial_link 
			while [[ "${testimonial_link}" == "" ]] ; do
			   read -p "Enter Testimonial link:" testimonial_link 
			done
			start Find_And_Replace.vbs "./$folderB/$myfolderA/$client_web/$file_name" "testimonial_link" "$testimonial_link"
			
			#_nickname 
			read -p "Enter nickname:" _nickname 
			while [[ "${_nickname}" == "" ]] ; do
			   read -p "Enter nickname:" _nickname   
			done
			sed -i -e "s/_nickname/${_nickname}/g" ./$folderB/$myfolderA/$client_web/$file_name
			
			break
			
            ;;
			
		"Login")
            echo "you chose choice $REPLY which is $opt"
			file_name="login_activation.txt"
			if [ -e "./template/$file_name" ]
			then
				#scrn_txt="$(<./$folderB/$myfolderA/$client_web/scrn.txt)"
				#cp ./template/login_activation.txt ./$folderB/$myfolderA/$client_web/login_activation.txt
				cp ./template/$file_name ./$folderB/$myfolderA/$client_web/$file_name
			else
				echo "File not found."
			fi
			break
			
            ;;
		"Upload")
            echo "you chose choice $REPLY which is $opt"
			file_name="upload_activation.txt"
			if [ -e "./template/$file_name" ]
			then
				#scrn_txt="$(<./$folderB/$myfolderA/$client_web/scrn.txt)"
				#cp ./template/upload_activation.txt ./$folderB/$myfolderA/$client_web/upload_activation.txt
				cp ./template/$file_name ./$folderB/$myfolderA/$client_web/$file_name
			else
				echo "File not found."
			fi
			break
			
            ;;
			
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done

#account_name
sed -i -e "s/account_name/${client_name}/g" ./$folderB/$myfolderA/$client_web/$file_name

#to_email 
read -p "Enter To email:" to_email 
while [[ "${to_email}" == "" ]] ; do
   read -p "Enter To email:" to_email   
done
sed -i -e "s/to_email/${to_email}/g" ./$folderB/$myfolderA/$client_web/$file_name

#cc_email
read -p "Enter CC email:" cc_email 
while [[ "${cc_email}" == "" ]] ; do
   read -p "Enter CC email:" cc_email 
done
sed -i -e "s/cc_email/${cc_email}/g" ./$folderB/$myfolderA/$client_web/$file_name

#to_queue
read -p "Enter To queue email:" to_queue 
while [[ "${to_queue}" == "" ]] ; do
   read -p "Enter To queue email:" to_queue 
done
sed -i -e "s/to_queue/${to_queue}/g" ./$folderB/$myfolderA/$client_web/$file_name

#techx_email
read -p "Enter Techx email:" techx_email 
while [[ "${techx_email}" == "" ]] ; do
   read -p "Enter Techx email:" techx_email 
done
sed -i -e "s/techx_email/${techx_email}/g" ./$folderB/$myfolderA/$client_web/$file_name

#config_email
read -p "Enter config email:" config_email 
while [[ "${config_email}" == "" ]] ; do
   read -p "Enter config email email:" config_email 
done
sed -i -e "s/config_email/${config_email}/g" ./$folderB/$myfolderA/$client_web/$file_name

#login_link
read -p "Enter login link:" login_link 
while [[ "${login_link}" == "" ]] ; do
   read -p "Enter login link:" login_link 
done
#sed -i -e "s/login_link/\"${login_link}\"/g" ./$folderB/$myfolderA/$client_web/$file_name
start Find_And_Replace.vbs "./$folderB/$myfolderA/$client_web/$file_name" "login_link" "$login_link"

#_username
read -p "Enter username:" _username 
while [[ "${_username}" == "" ]] ; do
   read -p "Enter username:" _username 
done
sed -i -e "s/_username/${_username}/g" ./$folderB/$myfolderA/$client_web/$file_name

#_password
read -p "Enter password:" _password  
while [[ "${_password}" == "" ]] ; do
   read -p "Enter password:" _password 
done
#sed -i -e "s/_password/${_password}/g" ./$folderB/$myfolderA/$client_web/$file_name
start Find_And_Replace.vbs "./$folderB/$myfolderA/$client_web/$file_name" "_password" "$_password"

#git_file_path
read -p "Enter Git file path:" git_file_path 
while [[ "${git_file_path}" == "" ]] ; do
   read -p "Enter Git file path:" git_file_path 
done
#sed -i -e "s/git_file_path/\"${git_file_path}\"/g" ./$folderB/$myfolderA/$client_web/$file_name
start Find_And_Replace.vbs "./$folderB/$myfolderA/$client_web/$file_name" "git_file_path" "$git_file_path"

#sed -i -e "s/scrn_file_path/\"$scrn_path_final\"/g" ./$folderB/$myfolderA/$client_web/$file_name

#website_link
if [ -e "./$folderB/$myfolderA/$client_web/website_link.txt" ]
then
    website_link="$(<./$folderB/$myfolderA/$client_web/website_link.txt)"
	#sed -i -e "s/website_link/\"$website_link\"/g" ./$folderB/$myfolderA/$client_web/$file_name
	start Find_And_Replace.vbs "./$folderB/$myfolderA/$client_web/$file_name" "website_link" "$website_link"
else
    #website_link=""
	start Find_And_Replace.vbs "./$folderB/$myfolderA/$client_web/$file_name" "website_link" "$website_link"
fi
#sed -i -e "s/website_link/\"$client_webA\"/g" ./$folderB/$myfolderA/$client_web/$file_name

#echo "The Screenshot File Path: " $scrn_path
#sed -i -e "s/$var1/$var2/g" /google.com.txt

read -p "Enter Y to proceed:" _y 

while [[ "${_y}" == "" ]] ; do
#read -p "Enter Y to proceed:" _y 
   if [ "${_y}" == "Y" ]; then
		#echo "You type uppercase letter $_y"
		echo ""
		break
	elif [ "${_y}" == "y" ]; then
		#echo "You type small letter $_y"
		echo ""
		break
			
	else 
	echo "You typed key: $_y"
	
	#break 
	fi 
	
	read -p "Enter Y to proceed:" _y 
	
done 

while [[ "${_y}" != "Y" && "${_y}" != "y" ]] ; do
	#read -p "Enter Y to proceed:" _y 
	if [ "${_y}" == "Y" ]; then
		#echo "You type uppercase letter $_y"
		echo ""
		break
	elif [ "${_y}" == "y" ]; then
		#echo "You type small letter $_y"
		echo ""
		break
			
	else 
	echo "You typed key: $_y"
	
	#break
	
	fi
	
	read -p "Enter Y to proceed:" _y 
	
done

# Directory to be zipped
#bu='./$folderB/$myfolderA/$client_web/bu'
bu='bu'

#Check the file or folder exists or not
if [[ -d "./$folderB/$myfolderA/$client_web/bu"  ||  -e "./$folderB/$myfolderA/$client_web/bu" ]]; then
    #Read filename without extension and
    #add .tar extension to create the compressed file
	cd ./$folderB/$myfolderA/$client_web
    filename="${bu%.*}.tar.zip"
    #Create the compressed file by using the `tar` command
    tar --create --file="$filename" "$bu"
    #Print the success message
    echo "The compressed file is created successfully."
	cd ../../../
	
else
    #Print the error message
    echo "File or Folder name does not exist: $bu"
fi

#up='./$folderB/$myfolderA/$client_web/up'
up='up'

#Check the file or folder exists or not
if [[ -d "./$folderB/$myfolderA/$client_web/up"  ||  -e "./$folderB/$myfolderA/$client_web/up" ]]; then
    #Read filename without extension and
    #add .tar extension to create the compressed file
	cd ./$folderB/$myfolderA/$client_web
    filename="${up%.*}.tar.zip"
    #Create the compressed file by using the `tar` command
    tar --create --file="$filename" "$up"
    #Print the success message
    echo "The compressed file is created successfully."
	cd ../../../
else
    #Print the error message
    echo "File or Folder name does not exist: $up"
fi

folder_B="$(<./month.txt)"
myfolderC=$(date '+%d-%Y')
#echo $myfolderC
s3_folder=$folder_B-$myfolderC-RicoLa

if [ ! -d "./$folderB/$myfolderA/$client_web/$s3_folder" ]; then
    #echo "Folder not exist";
	mkdir -p "./$folderB/$myfolderA/$client_web/$s3_folder";
	
	else 
	echo "Folder name $s3_folder already exist";
	
fi

if [ ! -d "./$folderB/$myfolderA/$client_web/screenshot" ]; then
	echo "Screenshot folder not exist"
	else 
	#cp -rf ./template ./programs
	cp -rf ./$folderB/$myfolderA/$client_web/screenshot ./$folderB/$myfolderA/$client_web/$s3_folder
fi 

if [ -e "./$folderB/$myfolderA/$client_web/bu.tar.zip" ]
then
    mv ./$folderB/$myfolderA/$client_web/bu.tar.zip ./$folderB/$myfolderA/$client_web/$s3_folder/bu.tar.zip 
else
    echo "File name bu.tar.zip not exist";
fi
#
if [ -e "./$folderB/$myfolderA/$client_web/up.tar.zip" ]
then
    mv ./$folderB/$myfolderA/$client_web/up.tar.zip ./$folderB/$myfolderA/$client_web/$s3_folder/up.tar.zip 
else
    echo "File name up.tar.zip not exist";
fi
#open folder 

#scrn_file_path
#scrn_file_path=$scrn_path_final
read -p "Enter Screenshot File Path:" scrn_path 
#echo "The Screenshot File Path: " $scrn_path

while [[ "${scrn_path}" == "" ]] ; do
   
   read -p "Enter Screenshot File Path:" scrn_path 
   #echo "The Screenshot File Path: " $scrn_path

  #(( i += 1 ))
done

echo "$scrn_path" | sed -r 's/^.{5}//' > ./$folderB/$myfolderA/$client_web/scrn.txt

if [ -e "./$folderB/$myfolderA/$client_web/scrn.txt" ]
then
    scrn_txt="$(<./$folderB/$myfolderA/$client_web/scrn.txt)"
else
    scrn_txt=""
fi


#scrn_path_pre="$scrn_path" | sed -r 's/^.{5}//'
scrn_path_final="https://s3.console.aws.amazon.com/s3/buckets/"$scrn_txt
#echo "The Screenshot File Path: " $scrn_txt
echo "The Screenshot File Path: " $scrn_path_final
echo "$scrn_path_final" > ./$folderB/$myfolderA/$client_web/scrn_out.txt

if [ -e "./$folderB/$myfolderA/$client_web/scrn_out.txt" ]
then
    scrn_out="$(<./$folderB/$myfolderA/$client_web/scrn_out.txt)"
	#sed -i -e "s/scrn_file_path/\"$scrn_out\"/g" ./$folderB/$myfolderA/$client_web/$file_name
	start Find_And_Replace.vbs "./$folderB/$myfolderA/$client_web/$file_name" "scrn_file_path" "$scrn_out"
else
    #scrn_out=""
	start Find_And_Replace.vbs "./$folderB/$myfolderA/$client_web/$file_name" "scrn_file_path" "$scrn_path_final"
fi

#cp ./template/$file_name ./$folderB/$myfolderA/$client_web/$file_name



