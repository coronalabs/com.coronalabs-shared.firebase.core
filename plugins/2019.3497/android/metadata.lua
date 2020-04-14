local metadata =
{
    plugin =
    {
        format = 'jar',
        manifest = 
        {
            permissions = {},
            usesPermissions = {
                "android.permission.INTERNET",
                "android.permission.ACCESS_NETWORK_STATE",
                "android.permission.WAKE_LOCK"
            },  
            usesFeatures = {},
            applicationChildElements = 
            {
                [[

                    <!-- FirebaseInstanceIdService performs security checks at runtime,
                         no need for explicit permissions despite exported="true" -->
                    <service android:name="com.google.firebase.iid.FirebaseInstanceIdService" android:exported="true">
                        <intent-filter android:priority="-500">
                            <action android:name="com.google.firebase.INSTANCE_ID_EVENT"/>
                        </intent-filter>
                    </service>

                    <provider android:authorities="@USER_ACTIVITY_PACKAGE@.firebaseinitprovider" 
                        android:name="com.google.firebase.provider.FirebaseInitProvider" android:exported="false" 
                        android:initOrder="100"/>

                    <receiver android:name="com.google.firebase.iid.FirebaseInstanceIdReceiver" android:exported="true" 
                        android:permission="com.google.android.c2dm.permission.SEND">
                        <intent-filter>
                            <action android:name="com.google.android.c2dm.intent.RECEIVE"/>
                            <action android:name="com.google.android.c2dm.intent.REGISTRATION"/>
                            <category android:name="@USER_ACTIVITY_PACKAGE@"/>
                        </intent-filter>
                    </receiver>
                
                    <service android:name="com.google.firebase.components.ComponentDiscoveryService">
                        <meta-data
                            android:name="com.google.firebase.components:com.google.firebase.analytics.connector.internal.AnalyticsConnectorRegistrar"
                            android:value="com.google.firebase.components.ComponentRegistrar" />
                        <meta-data
                            android:name="com.google.firebase.components:com.google.firebase.iid.Registrar"
                            android:value="com.google.firebase.components.ComponentRegistrar" />
                    </service>
                ]]
            }
        }
    },

    coronaManifest = {
        dependencies = {
            ["shared.google.play.services.base"] = "com.coronalabs"
        }
    }
}

return metadata
