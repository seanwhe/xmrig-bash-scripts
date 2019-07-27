build_xmrig () {
        if [ -d $_XMRIG_BUILD_LOCATION ]; then
                # Remove existing build directory
                echo "Found old build directory. Removing"
                rm -rf $_XMRIG_BUILD_LOCATION

                # Make new build directory
                echo "Creating a build directory"
                mkdir $_XMRIG_BUILD_LOCATION
        else
                # Make new build directory
                echo "Creating a build directory"
                mkdir $_XMRIG_BUILD_LOCATION
        fi

        # Change to build directory
        echo "Changing to build directory"
        cd $_XMRIG_BUILD_LOCATION

        # Configure cmake scafolding
        echo "Configuring cmake scafolding"
        cmake .. -DCMAKE_C_COMPILER=gcc-7 -DCMAKE_CXX_COMPILER=g++-7

        # Compile the software
        echo "Starting build"
        make
}


start_xmrig () {
        screen -dmS $_XMRIG_SCREEN xmrig --config=$_XMRIG_CONFIG_LOCATION
}


stop_xmrig () {
        screen -S $_XMRIG_SCREEN -X kill
}
