LoadDll

import mForex.API.*;
import mForex.API.Matlab.*;
import Samples.TickChart.*

[login, password, serverType] = GetLoginData;

% create plotter 
p = Plotter(10);

%create API Client and Login
client = ApiClient;
client.Login(login, password, serverType.toDotNet);

%create listener
event.listener(client,'Ticks',@(src, evnt) p.Refresh(src, evnt));

%register for ticks
lh = client.RegisterTicks('GBPUSD');

%Remove listener
    %delete(lh)

%deregister from ticks update
    %client.RegisterTicks('GBPUSD', RegistrationAction.Unregister);
