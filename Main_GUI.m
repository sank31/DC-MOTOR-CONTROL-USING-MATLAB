function varargout = Main_GUI(varargin)
% MAIN_GUI MATLAB code for Main_GUI.fig
%      MAIN_GUI, by itself, creates a new MAIN_GUI or raises the existing
%      singleton*.
%
%      H = MAIN_GUI returns the handle to a new MAIN_GUI or the handle to
%      the existing singleton*.
%
%      MAIN_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAIN_GUI.M with the given input arguments.
%
%      MAIN_GUI('Property','Value',...) creates a new MAIN_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Main_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Main_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Main_GUI

% Last Modified by GUIDE v2.5 08-Apr-2017 02:40:36

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Main_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @Main_GUI_OutputFcn, ...
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
% End initialization code - DO NOT EDIT


% --- Executes just before Main_GUI is made visible.
function Main_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Main_GUI (see VARARGIN)

% Choose default command line output for Main_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Main_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Main_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in StartSerial.
function StartSerial_Callback(hObject, eventdata, handles)
% hObject    handle to StartSerial (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc
global tep;
disp('Welcome to TEP');
disp('');
disp('www.TheEngineeringProjects.com');
disp('');
tep=serial('COM5'); % assign serial port object
set(tep, 'BaudRate', 9600); % set BaudRate to 9600
set(tep, 'Parity', 'none'); % set Parity Bit to None
set(tep, 'DataBits', 8); % set DataBits to 8
set(tep, 'StopBit', 1); % set StopBit to 1
%display the properties of serial port object in MATLAB Window
disp(get(tep,{'Type','Name','Port','BaudRate','Parity','DataBits','StopBits'}));
fopen(tep); % Open Serial Port Object

% --- Executes on button press in StopSerial.
function StopSerial_Callback(hObject, eventdata, handles)
% hObject    handle to StopSerial (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global tep;
fclose(tep);

% --- Executes on button press in Clockwise.
function Clockwise_Callback(hObject, eventdata, handles)
% hObject    handle to Clockwise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global tep
fwrite(tep,'C'); %Print character ‘a’ to the serial port
disp('Charater sent to Serial Port is “C”.');
set(handles.text3, 'String','Motor is rotating in clockwise direction');

% --- Executes on button press in C_Accelrate.
function C_Accelrate_Callback(hObject, eventdata, handles)
% hObject    handle to C_Accelrate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global tep
fwrite(tep,'H'); %Print character ‘a’ to the serial port
disp('Charater sent to Serial Port is “H”.');
set(handles.text3, 'String','Motor is accerating slowly');


% --- Executes on button press in AntiClockwise.
function AntiClockwise_Callback(hObject, eventdata, handles)
% hObject    handle to AntiClockwise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global tep
fwrite(tep,'A'); %Print character ‘a’ to the serial port
disp('Charater sent to Serial Port is “A”.');
set(handles.text3, 'String','Motor is rotating in anti clockwise direction');

% --- Executes on button press in A_Accelrate.
function A_Accelrate_Callback(hObject, eventdata, handles)
% hObject    handle to A_Accelrate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global tep
fwrite(tep,'M'); %Print character ‘a’ to the serial port
disp('Charater sent to Serial Port is “M”.');
set(handles.text3, 'String','Motor is accerating slowly');

% --- Executes on button press in StopMotor.
function StopMotor_Callback(hObject, eventdata, handles)
% hObject    handle to StopMotor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global tep
fwrite(tep,'S'); %Print character ‘a’ to the serial port
disp('Charater sent to Serial Port is “S”.');
set(handles.text3, 'String','Motor is stopped');


% --- Executes on button press in C_Deaccelrate.
function C_Deaccelrate_Callback(hObject, eventdata, handles)
% hObject    handle to C_Deaccelrate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global tep
fwrite(tep,'L'); %Print character ‘a’ to the serial port
disp('Charater sent to Serial Port is “L”.');
set(handles.text3, 'String','Motor is deaccerating slowly');

% --- Executes on button press in A_Deaccelrate.
function A_Deaccelrate_Callback(hObject, eventdata, handles)
% hObject    handle to A_Deaccelrate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global tep
fwrite(tep,'N'); %Print character ‘a’ to the serial port
disp('Charater sent to Serial Port is “N”.');
set(handles.text3, 'String','Motor is deaccerating slowly');



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
