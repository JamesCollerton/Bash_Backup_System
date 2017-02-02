clear

echo "-------------------------------------------"
echo ""
echo "Currently installing bash backup"
echo ""
echo "-------------------------------------------"

echo ""
echo ""

echo "Enter directory to back up."
read backUpDirectory

echo ""
echo ""

echo "Enter directory to back up to."
read backUpLocation

echo ""
echo ""

rm Configurations/config.sh
touch Configurations/config.sh

echo "backUpDirectory=$backUpDirectory" >> Configurations/config.sh 
echo "Written back up directory location"
echo ""

echo "backLocation=$backUpLocation" >> Configurations/config.sh
echo "Written back up location"
echo ""

