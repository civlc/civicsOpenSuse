#!/usr/bin/env bash

echo -e "\e[1;32m
                                     ......            Civic's Post-Install Script
     .,cdxxxoc,.               .:kKMMMNWMMMNk:.        ---------------------------
    cKMMN0OOOKWMMXo. A        ;0MWk:'      ':OMMk.        For OpenSUSE desktops
  ;WMK;'       'lKMMNM,     :NMK'             'OMW;
 cMW;             WMMMN   ,XMK'                 oMM.
.MMc             ''^*~l. xMN:                    KM0   \e[0m
'MM.                   .NMO                      oMM   \e[1;35m
.MM,                 .kMMl                       xMN
 KM0               .kMM0' .dl>~,.               .WMd
 'XM0.           ,OMMK'    OMMM7'              .XMK
   *WMO:.    .;xNMMk'       NNNMKl.          .xWMx
     ^ONMMNXMMMKx;          V  'xNMWKkxllox0NMWk'
         '''''                    ':dOOXXKOxl' \e[0m
";
sleep 5;
echo -e "


\e[1;36m===  Refreshing Repositories...  ===\e[0m";
sleep 1;
sudo zypper ref;
echo -e "\e[1;33m-- Done. \e[0m";
sleep 1;
echo -e "
\e[1;35m===  Downloading OPI...  ===\e[0m";
sleep 1;
sudo zypper in opi;
echo -e "\e[1;33m-- Done. \e[0m";
sleep 1;
echo -e "
\e[1;35m===  Downloading Codecs + Packman Repo...  ==\e[0m";
sleep 1;
opi codecs;
echo -e "\e[1;33m-- Done. \e[0m";
sleep 1;
echo -e "
\e[1;35m===  Downloading MS Fonts...  ===\e[0m";
sleep 1;
sudo zypper in fetchmsttfonts;
echo -e "\e[1;33m-- Done. \e[0m";
sleep 1;

echo -e "
\e[1;31m-- Do you want to remove Discover and Kalendarac? (KDE Only) \e[0m"
PS3="-> "
options=("Yes" "No")
select opt in "${options[@]}"
do
  case $opt in
  "Yes")
echo -e "
\e[1;31m===  Uninstalling Discover + Kalendarac...  ===\e[0m"
sleep 3;
sudo zypper rm discover discover-backend-flatpak discover-backend-fwupd discover-backend-packagekit discover-lang discover-notifier kalendarac;
sudo zypper al discover discover-backend-flatpak discover-backend-fwupd discover-backend-packagekit discover-lang discover-notifier kalendarac;
echo -e "\e[1;33m-- Done. \e[0m";
break ;;

 "No")
break ;;
  *)
  echo "Invalid Option $REPLY";;
esac
done
echo -e "
\e[1;35m-- Thanks for using my script! Enjoy!
\e[1;36m-- You should upgrade your system now.\e[0m";
