function varargout = SMAC_GUI(varargin)
% SMAC_GUI MATLAB code for SMAC_GUI.fig
%      SMAC_GUI, by itself, creates a new SMAC_GUI or raises the existing
%      singleton*.
%
%      H = SMAC_GUI returns the handle to a new SMAC_GUI or the handle to
%      the existing singleton*.
%
%      SMAC_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SMAC_GUI.M with the given input arguments.
%
%      SMAC_GUI('Property','Value',...) creates a new SMAC_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before SMAC_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to SMAC_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help SMAC_GUI

% Last Modified by GUIDE v2.5 12-Jan-2017 00:02:42

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @SMAC_GUI_OpeningFcn, ...
    'gui_OutputFcn',  @SMAC_GUI_OutputFcn, ...
    'gui_LayoutFcn',  [] , ...
    'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end

cd ..
init;
cd GUI

% End initialization code - DO NOT EDIT


% --- Executes just before SMAC_GUI is made visible.
function SMAC_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SMAC_GUI (see VARARGIN)
%
% clr=[0.84,0.84,0.84];
% set(gcf,'Color',clr);
% set(gcf, 'Units','characters');
% set(handles.Image,'BackgroundColor',clr);
% set(handles.Labels,'BackgroundColor',clr);
% set(handles.Image_Index,'BackgroundColor',clr);
% set(handles.Output,'BackgroundColor',clr);
% set(handles.D1,'BackgroundColor',clr);
% set(handles.D2,'BackgroundColor',clr);
% set(handles.D3,'BackgroundColor',clr);
% set(handles.lambda1,'BackgroundColor',clr);
% set(handles.lambda2,'BackgroundColor',clr);


% Choose default command line output for SMAC_GUI
handles.output = hObject;

set(hObject, 'Name','SMAC version 1.0');

im=imread('uncLogo.jpg');
handles.h1 = image(im,'Parent',handles.axes1);
set(handles.axes1,'Visible','off')


im=imread('BIGS2-LOGO4.jpg');
handles.h2 = image(im,'Parent',handles.axes2);
set(handles.axes2,'Visible','off')

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes SMAC_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = SMAC_GUI_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Image.
function Image_Callback(hObject, eventdata, handles)
% hObject    handle to Image (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

button_state = get(hObject,'Value');
if button_state == get(hObject,'Max')
    Image = uigetfile({'*.mat';'*.txt'},'Select data file');
    if Image~=0
        set(handles.Image,'UserData',Image);
    end
end

% Hint: get(hObject,'Value') returns toggle state of Image

% --- Executes on button press in Labels.
function Labels_Callback(hObject, eventdata, handles)
% hObject    handle to Labels (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

button_state = get(hObject,'Value');
if button_state == get(hObject,'Max')
    Labels = uigetfile({'*.mat';'*.txt'},'Select data file');
    if Labels~=0
        set(handles.Labels,'UserData',Labels);
    end
end

% Hint: get(hObject,'Value') returns toggle state of Labels


% --- Executes on button press in Image_Index.
function Image_Index_Callback(hObject, eventdata, handles)
% hObject    handle to Image_Index (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

button_state = get(hObject,'Value');
if button_state == get(hObject,'Max')
    Imageindex_str = uigetfile({'*.mat';'*.txt'},'Select data file');
    if Imageindex_str~=0
        set(handles.Image_Index,'UserData',Imageindex_str);
    end
end

% Hint: get(hObject,'Value') returns toggle state of Labels




function D1_Callback(hObject, eventdata, handles)
% hObject    handle to D1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of D1 as text
%        str2double(get(hObject,'String')) returns contents of D1 as a double


% --- Executes during object creation, after setting all properties.
function D1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to D1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function D2_Callback(hObject, eventdata, handles)
% hObject    handle to D2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of D2 as text
%        str2double(get(hObject,'String')) returns contents of D2 as a double


% --- Executes during object creation, after setting all properties.
function D2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to D2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function D3_Callback(hObject, eventdata, handles)
% hObject    handle to D3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of D3 as text
%        str2double(get(hObject,'String')) returns contents of D3 as a double


% --- Executes during object creation, after setting all properties.
function D3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to D3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

guidata(hObject,handles);
% Hint: get(hObject,'Value') returns toggle state of Clear



function lambda1_Callback(hObject, eventdata, handles)
% hObject    handle to lambda1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of lambda1 as text
%        str2double(get(hObject,'String')) returns contents of lambda1 as a double


% --- Executes during object creation, after setting all properties.
function lambda1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lambda1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function lambda2_Callback(hObject, eventdata, handles)
% hObject    handle to lambda2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of lambda2 as text
%        str2double(get(hObject,'String')) returns contents of lambda2 as a double


% --- Executes during object creation, after setting all properties.
function lambda2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lambda2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Determine the selected data set.
% Set current data to the selected data set.

% Save the handles structure.
guidata(hObject,handles)
% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function K_Callback(hObject, eventdata, handles)
% hObject    handle to K (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of K as text
%        str2double(get(hObject,'String')) returns contents of K as a double


% --- Executes during object creation, after setting all properties.
function K_CreateFcn(hObject, eventdata, handles)
% hObject    handle to K (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Output.
function Output_Callback(hObject, eventdata, handles)
% hObject    handle to Output (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


button_state = get(hObject,'Value');
if button_state == get(hObject,'Max')
    OutputDir= uigetdir;
    if OutputDir~=0
        set(handles.Output,'UserData',OutputDir);
    end
end
guidata(hObject,handles);

% Hint: get(hObject,'Value') returns toggle state of Output

% --- Executes on button press in Run.
function Run_Callback(hObject, eventdata, handles)
% hObject    handle to Run (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc
tic


ImageName= get(handles.Image,'UserData');
if isempty(ImageName)
    warndlg('Please select the Covariates file by pressing "Image Data" button')
    return;
end
if strcmp(ImageName(end-2:end),'mat')
    temp=load(ImageName);
    temp1=whos('-file',ImageName);
    X=temp.(temp1.name);
else
    X=load(ImageName);
end


LabelsName= get(handles.Labels,'UserData');
if isempty(LabelsName)
    warndlg('Please select the Data file by pressing "Labels" button')
    return;
end
if strcmp(LabelsName(end-2:end),'mat')
    temp=load(LabelsName);
    temp1=whos('-file',LabelsName);
    Y=temp.(temp1.name);
else
    Y=load(LabelsName);
end


Image_IndexName= get(handles.Image_Index,'UserData');
if isempty(Image_IndexName)
    index=[];
    Flag=0;
else
    Flag=1;
    if strcmp(Image_IndexName(end-2:end),'mat')
        temp=load(Image_IndexName);
        temp1=whos('-file',Image_IndexName);
        index=temp.(temp1.name);
    else
        index=load(Image_IndexName);
    end
end


Output= get(handles.Output,'UserData');
if isempty(Output)
    warndlg('Please select the output folder by pressing "Directory" button')
    return;
end

Imagesize = zeros(1,3);
D1 = get(handles.D1,'string');
Imagesize(1) = str2double(D1);
D2 = get(handles.D2,'string');
Imagesize(2) = str2double(D2);
D3 = get(handles.D3,'string');
Imagesize(3) = str2double(D3);
if D3=='1'
    Imagesize(3)=[];
end


l1 = get(handles.lambda1,'string');
l2 = get(handles.lambda2,'string');

fprintf('+++++++Your job is started!!+++++++\n');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% Start calling functions of FLMAC %%%%

data.train_x = X;
data.train_y = Y;
data.tune_x = X;
data.tune_y = Y;
data.test_x = X;
data.test_y = Y;
data.index = index;

imagesize = Imagesize;

options.itmax=1000;
options.rho=1;
options.l1flag =0;
options.tol=5E-4;
options.progress = false;
options.lambda1 = eval(l1);
options.lambda2 = eval(l2);

Penalty_type = get(handles.popupmenu1,'value');

if Penalty_type == 1
    [out] = SMAC_I (data,imagesize,options);
else
    [out] = SMAC_II (data,imagesize,options);
end
%%%% Finish calling functions of FLMAC %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

toc
str=fullfile(Output,'SMAC_results.mat');
save(str,'out','data','imagesize')

k = length(unique(Y));
for iii = 1:k-1
    eval( sprintf('view_nii(make_nii(-out.coef_%d));',iii));
    colormap(fireice);
end



fprintf('+++++++Your job is finished!!+++++++\n');

guidata(hObject,handles);

% Hint: get(hObject,'Value') returns toggle state of RUN


% --- Executes on button press in Clear.
function Clear_Callback(hObject, eventdata, handles)
% hObject    handle to Clear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(handles.Image,'UserData','');
set(handles.Labels,'UserData','');
set(handles.Image_Index,'UserData','');
set(handles.Output,'UserData','');
set(handles.D1,'string','');
set(handles.D2,'string','');
set(handles.D3,'string','');
set(handles.lambda1,'string','');
set(handles.lambda2,'string','');
guidata(hObject,handles);
% Hint: get(hObject,'Value') returns toggle state of Clear
