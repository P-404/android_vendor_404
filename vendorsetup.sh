devices=('cepheus')

function lunch_devices() {
    add_lunch_combo p404_${device}-user
    add_lunch_combo p404_${device}-userdebug
}

for device in ${devices[@]}; do
    lunch_devices
done
