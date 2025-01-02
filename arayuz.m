function varargout = arayuz(varargin)

% ARAYUZ MATLAB code for arayuz.fig
%      ARAYUZ, by itself, creates a new ARAYUZ or raises the existing
%      singleton*.
%
%      H = ARAYUZ returns the handle to a new ARAYUZ or the handle to
%      the existing singleton*.
%
%      ARAYUZ('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ARAYUZ.M with the given input arguments.
%
%      ARAYUZ('Property','Value',...) creates a new ARAYUZ or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before arayuz_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to arayuz_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help arayuz

% Last Modified by GUIDE v2.5 13-Jun-2024 04:09:46

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @arayuz_OpeningFcn, ...
                   'gui_OutputFcn',  @arayuz_OutputFcn, ...
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


% --- Executes just before arayuz is made visible.
function arayuz_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to arayuz (see VARARGIN)

% Choose default command line output for arayuz
handles.output = hObject;
 % Global handles yapýsýný oluþturun
    global ghandles;
    ghandles = handles;
% Update handles structure
guidata(hObject, handles);

 fullpath = 'C:\Users\ceyda\Desktop\proje\Bitirme\matlab\konumlar.mat';
 data = load(fullpath);
  % Varsayalým ki iki sütunlu matrisimiz 'data' deðiþkeninde 'matrix' ismiyle kayýtlý
    if isfield(data, 'konumlar')
        konumlar = data.konumlar;
        if size(konumlar, 2) ~= 2
            errordlg('The matrix must have exactly 2 columns.', 'Invalid Data');
            return;
        end
    else
        errordlg('The MAT-file does not contain a variable named ''matrix''.', 'Invalid Data');
        return;
    end

    % Uitable'a veriyi ekleme
    set(handles.uitable1, 'Data', konumlar);
     data = get(handles.uitable1, 'Data');
    
    % Satýr sayýsýný al
    [numRows, ~] = size(data);
    
    % Satýr isimlerini oluþtur
    rowNames = cell(numRows, 1);
    rowNames{1} = 'Okul'; % Ýlk satýr ismi
    
    % Diðer satýrlarý numaralandýr
    for i = 2:numRows
        rowNames{i} = num2str(i-1);
    end
    
    % Satýr isimlerini uitable'a ayarla
    set(handles.uitable1, 'RowName', rowNames);
    set(handles.checkbox2, 'Value', 0);
        set(handles.checkbox1, 'Value', 0);
        set(handles.checkbox3, 'Value', 0);
        set(handles.checkbox4, 'Value', 0);
        set(handles.checkbox5, 'Value', 0);
        set(handles.checkbox6, 'Value', 0);
    
    
    set(handles.checkbox1, 'Enable', 'off');
    set(handles.checkbox2, 'Enable', 'off');
    set(handles.checkbox3, 'Enable', 'off');
    set(handles.checkbox4, 'Enable', 'off');
    set(handles.checkbox5, 'Enable', 'off');
    set(handles.checkbox6, 'Enable', 'off');
    set(handles.rotatext,'String','');
    set(handles.sonuc,'String','');
    
    set(handles.radiobuttonPMX, 'Value', 1);
    set(handles.radiobuttonCX, 'Value', 0);
    set(handles.radiobuttonOBX, 'Value', 0);
    set(handles.radiobuttonUCX, 'Value', 0);
    set(handles.radiobuttonPBX, 'Value', 0);
    set(handles.radiobuttonOX, 'Value', 0);
    
    global caprazlamayontemi;
    caprazlamayontemi=1;
    global Itersay;
    Itersay=2000;
    global Crossrate;
    Crossrate=0.8;
    global Mutrate;
    Mutrate=0.1;
    global Elitrate;
    Elitrate=0.2;
    global mutasyonop;
    mutasyonop=1;
    axes(handles.axes);
    % axes bileþenini temizle
    cla(handles.axes);
    % Update handles structure
    
set(ghandles.edit1, 'String', '2000');
set(ghandles.edit2, 'String', '80');
set(ghandles.edit3, 'String', '10');
set(ghandles.edit4, 'String', '40');
    guidata(hObject, handles);


% UIWAIT makes arayuz wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = arayuz_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% axes1 üzerinde bir grafik çizme
 if get(hObject, 'Value')
        set(handles.checkbox2, 'Value', 0);
        set(handles.checkbox3, 'Value', 0);
         set(handles.checkbox4, 'Value', 0);
          set(handles.checkbox5, 'Value', 0);
           set(handles.checkbox6, 'Value', 0);
 end
 
axes(handles.axes);
% axes bileþenini temizle
cla(handles.axes); 
data = load('mydurak_konumlari.mat'); % Dosyadan deðiþkeni yükle
konumlar=data.durak_ortalama_konumlar;
data = load('myeniyibirey.mat'); % Dosyadan deðiþkeni yükle
eniyibirey=data.eniyibirey;
arackap=26;
toplamsay=136;
hold on;
h=plot(konumlar(136, 2),konumlar(136, 1), 'xr');
h.LineWidth=3;
for i = 1:23
    plot(konumlar(eniyibirey(1,i), 2),konumlar(eniyibirey(1,i), 1), 'ob');
end
plot(konumlar(eniyibirey(1,1),2),konumlar(eniyibirey(1,1),1),'or'); %baþlangýç noktasý
%plot(konumlar(374,2),konumlar(374,1),'og');
%plot(konumlar(351,2),konumlar(351,1),'og');
for d=1:22
    x=[konumlar(eniyibirey(1,d),2) konumlar(eniyibirey(1,d+1),2)];
    y=[konumlar(eniyibirey(1,d),1) konumlar(eniyibirey(1,d+1),1)];
    plot(x,y,'-');
end
x=[konumlar(eniyibirey(1,d+1),2) konumlar(toplamsay,2)];
y=[konumlar(eniyibirey(1,d+1),1) konumlar(toplamsay,1)];
plot(x,y,'-');

%x=[konumlar(5,2) konumlar(5,2)];
%y=[konumlar(457,1) konumlar(508,1)];
%plot(x,y,'-');
grid on;
hold off;
cellArray = arrayfun(@num2str, eniyibirey, 'UniformOutput', false);
% Ýlk 26 elemaný seçin
first26Cells = cellArray(1:26);
combinedString = strjoin(first26Cells, '-'); % Boþlukla birleþtir
set(handles.rotatext,'String',combinedString);
% Hint: get(hObject,'Value') returns toggle state of checkbox1


% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 if get(hObject, 'Value')
        set(handles.checkbox1, 'Value', 0);
        set(handles.checkbox3, 'Value', 0);
         set(handles.checkbox4, 'Value', 0);
          set(handles.checkbox5, 'Value', 0);
           set(handles.checkbox6, 'Value', 0);
 end
axes(handles.axes);
% axes bileþenini temizle
cla(handles.axes); 
data = load('mydurak_konumlari.mat'); % Dosyadan deðiþkeni yükle
konumlar=data.durak_ortalama_konumlar;
data = load('myeniyibirey.mat'); % Dosyadan deðiþkeni yükle
eniyibirey=data.eniyibirey;
arackap=26;
toplamsay=136;
hold on;
h=plot(konumlar(136, 2),konumlar(136, 1), 'xr');
h.LineWidth=3;
for i = 24:46
    plot(konumlar(eniyibirey(1,i), 2),konumlar(eniyibirey(1,i), 1), 'ob');
end
plot(konumlar(eniyibirey(1,24),2),konumlar(eniyibirey(1,24),1),'or'); %baþlangýç noktasý
%plot(konumlar(374,2),konumlar(374,1),'og');
%plot(konumlar(351,2),konumlar(351,1),'og');
for d=24:45
    x=[konumlar(eniyibirey(1,d),2) konumlar(eniyibirey(1,d+1),2)];
    y=[konumlar(eniyibirey(1,d),1) konumlar(eniyibirey(1,d+1),1)];
    plot(x,y,'-');
end
x=[konumlar(eniyibirey(1,d+1),2) konumlar(toplamsay,2)];
y=[konumlar(eniyibirey(1,d+1),1) konumlar(toplamsay,1)];
plot(x,y,'-');

grid on;
hold off;
cellArray = arrayfun(@num2str, eniyibirey, 'UniformOutput', false);
Cells = cellArray(24:46);
combinedString = strjoin(Cells, '-');
set(handles.rotatext,'String',combinedString);
% Hint: get(hObject,'Value') returns toggle state of checkbox2


% --- Executes on button press in checkbox3.
function checkbox3_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 if get(hObject, 'Value')
        set(handles.checkbox2, 'Value', 0);
        set(handles.checkbox1, 'Value', 0);
         set(handles.checkbox4, 'Value', 0);
          set(handles.checkbox5, 'Value', 0);
           set(handles.checkbox6, 'Value', 0);
 end
 axes(handles.axes);
% axes bileþenini temizle
cla(handles.axes); 
data = load('mydurak_konumlari.mat'); % Dosyadan deðiþkeni yükle
konumlar=data.durak_ortalama_konumlar;
data = load('myeniyibirey.mat'); % Dosyadan deðiþkeni yükle
eniyibirey=data.eniyibirey;
arackap=26;
toplamsay=136;
hold on;
h=plot(konumlar(136, 2),konumlar(136, 1), 'xr');
h.LineWidth=3;
for i = 47:69
    plot(konumlar(eniyibirey(1,i), 2),konumlar(eniyibirey(1,i), 1), 'ob');
end
plot(konumlar(eniyibirey(1,47),2),konumlar(eniyibirey(1,47),1),'or'); %baþlangýç noktasý
%plot(konumlar(374,2),konumlar(374,1),'og');
%plot(konumlar(351,2),konumlar(351,1),'og');
for d=47:68
    x=[konumlar(eniyibirey(1,d),2) konumlar(eniyibirey(1,d+1),2)];
    y=[konumlar(eniyibirey(1,d),1) konumlar(eniyibirey(1,d+1),1)];
    plot(x,y,'-');
end
x=[konumlar(eniyibirey(1,d+1),2) konumlar(toplamsay,2)];
y=[konumlar(eniyibirey(1,d+1),1) konumlar(toplamsay,1)];
plot(x,y,'-');

%x=[konumlar(5,2) konumlar(5,2)];
%y=[konumlar(457,1) konumlar(508,1)];
%plot(x,y,'-');
grid on;
hold off;
 cellArray = arrayfun(@num2str, eniyibirey, 'UniformOutput', false);
Cells = cellArray(47:69);
combinedString = strjoin(Cells, '-'); % Boþlukla birleþtir
set(handles.rotatext,'String',combinedString);
% Hint: get(hObject,'Value') returns toggle state of checkbox3
% --- Executes on button press in checkbox4.

function checkbox4_Callback(hObject, eventdata, handles)
 if get(hObject, 'Value')
        set(handles.checkbox2, 'Value', 0);
        set(handles.checkbox3, 'Value', 0);
         set(handles.checkbox1, 'Value', 0);
          set(handles.checkbox5, 'Value', 0);
           set(handles.checkbox6, 'Value', 0);
 end
 axes(handles.axes);
% axes bileþenini temizle
cla(handles.axes); 
data = load('mydurak_konumlari.mat'); % Dosyadan deðiþkeni yükle
konumlar=data.durak_ortalama_konumlar;
data = load('myeniyibirey.mat'); % Dosyadan deðiþkeni yükle
eniyibirey=data.eniyibirey;
arackap=26;
toplamsay=136;
hold on;
h=plot(konumlar(136, 2),konumlar(136, 1), 'xr');
h.LineWidth=3;
for i = 70:92
    plot(konumlar(eniyibirey(1,i), 2),konumlar(eniyibirey(1,i), 1), 'ob');
end
plot(konumlar(eniyibirey(1,70),2),konumlar(eniyibirey(1,70),1),'or'); %baþlangýç noktasý
%plot(konumlar(374,2),konumlar(374,1),'og');
%plot(konumlar(351,2),konumlar(351,1),'og');
for d=70:91
    x=[konumlar(eniyibirey(1,d),2) konumlar(eniyibirey(1,d+1),2)];
    y=[konumlar(eniyibirey(1,d),1) konumlar(eniyibirey(1,d+1),1)];
    plot(x,y,'-');
end
x=[konumlar(eniyibirey(1,d+1),2) konumlar(toplamsay,2)];
y=[konumlar(eniyibirey(1,d+1),1) konumlar(toplamsay,1)];
plot(x,y,'-');

%x=[konumlar(5,2) konumlar(5,2)];
%y=[konumlar(457,1) konumlar(508,1)];
%plot(x,y,'-');
grid on;
hold off;
 cellArray = arrayfun(@num2str, eniyibirey, 'UniformOutput', false);
Cells = cellArray(70:92);
combinedString = strjoin(Cells, '-'); % Boþlukla birleþtir
set(handles.rotatext,'String',combinedString);


% --- Executes on button press in checkbox5.
function checkbox5_Callback(hObject, eventdata, handles)
if get(hObject, 'Value')
        set(handles.checkbox2, 'Value', 0);
        set(handles.checkbox3, 'Value', 0);
         set(handles.checkbox4, 'Value', 0);
          set(handles.checkbox1, 'Value', 0);
           set(handles.checkbox6, 'Value', 0);
 end
 axes(handles.axes);
% axes bileþenini temizle
cla(handles.axes); 
data = load('mydurak_konumlari.mat'); % Dosyadan deðiþkeni yükle
konumlar=data.durak_ortalama_konumlar;
data = load('myeniyibirey.mat'); % Dosyadan deðiþkeni yükle
eniyibirey=data.eniyibirey;
arackap=26;
toplamsay=136;
hold on;
h=plot(konumlar(136, 2),konumlar(136, 1), 'xr');
h.LineWidth=3;
for i = 93:115
    plot(konumlar(eniyibirey(1,i), 2),konumlar(eniyibirey(1,i), 1), 'ob');
end
plot(konumlar(eniyibirey(1,93),2),konumlar(eniyibirey(1,93),1),'or'); %baþlangýç noktasý
%plot(konumlar(374,2),konumlar(374,1),'og');
%plot(konumlar(351,2),konumlar(351,1),'og');
for d=93:114
    x=[konumlar(eniyibirey(1,d),2) konumlar(eniyibirey(1,d+1),2)];
    y=[konumlar(eniyibirey(1,d),1) konumlar(eniyibirey(1,d+1),1)];
    plot(x,y,'-');
end
x=[konumlar(eniyibirey(1,d+1),2) konumlar(toplamsay,2)];
y=[konumlar(eniyibirey(1,d+1),1) konumlar(toplamsay,1)];
plot(x,y,'-');

%x=[konumlar(5,2) konumlar(5,2)];
%y=[konumlar(457,1) konumlar(508,1)];
%plot(x,y,'-');
grid on;
hold off;
 cellArray = arrayfun(@num2str, eniyibirey, 'UniformOutput', false);
Cells = cellArray(93:115);
combinedString = strjoin(Cells, '-'); % Boþlukla birleþtir
set(handles.rotatext,'String',combinedString);


% --- Executes on button press in checkbox6.
function checkbox6_Callback(hObject, eventdata, handles)
if get(hObject, 'Value')
        set(handles.checkbox2, 'Value', 0);
        set(handles.checkbox3, 'Value', 0);
         set(handles.checkbox4, 'Value', 0);
          set(handles.checkbox5, 'Value', 0);
           set(handles.checkbox1, 'Value', 0);
 end
 axes(handles.axes);
% axes bileþenini temizle
cla(handles.axes); 
data = load('mydurak_konumlari.mat'); % Dosyadan deðiþkeni yükle
konumlar=data.durak_ortalama_konumlar;
data = load('myeniyibirey.mat'); % Dosyadan deðiþkeni yükle
eniyibirey=data.eniyibirey;
arackap=26;
toplamsay=136;
hold on;
h=plot(konumlar(136, 2),konumlar(136, 1), 'xr');
h.LineWidth=3;
for i = 116:136
    plot(konumlar(eniyibirey(1,i), 2),konumlar(eniyibirey(1,i), 1), 'ob');
end
plot(konumlar(eniyibirey(1,116),2),konumlar(eniyibirey(1,116),1),'or'); %baþlangýç noktasý
%plot(konumlar(374,2),konumlar(374,1),'og');
%plot(konumlar(351,2),konumlar(351,1),'og');
for d=116:135
    x=[konumlar(eniyibirey(1,d),2) konumlar(eniyibirey(1,d+1),2)];
    y=[konumlar(eniyibirey(1,d),1) konumlar(eniyibirey(1,d+1),1)];
    plot(x,y,'-');
end
x=[konumlar(eniyibirey(1,d+1),2) konumlar(toplamsay,2)];
y=[konumlar(eniyibirey(1,d+1),1) konumlar(toplamsay,1)];
plot(x,y,'-');

%x=[konumlar(5,2) konumlar(5,2)];
%y=[konumlar(457,1) konumlar(508,1)];
%plot(x,y,'-');
grid on;
hold off;
 cellArray = arrayfun(@num2str, eniyibirey, 'UniformOutput', false);
Cells = cellArray(116:136);
combinedString = strjoin(Cells, '-'); % Boþlukla birleþtir
set(handles.rotatext,'String',combinedString);

% --- Executes on button press in pushbutton.
function pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
genetik;


% --- Executes on button press in radiobuttonPMX.
function radiobuttonPMX_Callback(hObject, eventdata, handles)
% hObject    handle to radiobuttonPMX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of radiobuttonPMX
 if get(hObject, 'Value')
        set(handles.checkbox2, 'Value', 0);
        set(handles.checkbox1, 'Value', 0);
        set(handles.checkbox3, 'Value', 0);
        set(handles.checkbox4, 'Value', 0);
        set(handles.checkbox5, 'Value', 0);
        set(handles.checkbox6, 'Value', 0);
 end
set(handles.sonuc,'String','');
set(handles.rotatext,'String','');
axes(handles.axes);
    % axes bileþenini temizle
    cla(handles.axes);
global caprazlamayontemi;
caprazlamayontemi=1;


% --- Executes on button press in radiobuttonCX.
function radiobuttonCX_Callback(hObject, eventdata, handles)
% hObject    handle to radiobuttonCX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(hObject, 'Value')
        set(handles.checkbox2, 'Value', 0);
        set(handles.checkbox1, 'Value', 0);
        set(handles.checkbox3, 'Value', 0);
        set(handles.checkbox4, 'Value', 0);
        set(handles.checkbox5, 'Value', 0);
        set(handles.checkbox6, 'Value', 0);
 end
set(handles.sonuc,'String','');
set(handles.rotatext,'String','');
axes(handles.axes);
    % axes bileþenini temizle
    cla(handles.axes);
global caprazlamayontemi;
caprazlamayontemi=2;
% Hint: get(hObject,'Value') returns toggle state of radiobuttonCX


% --- Executes on button press in radiobuttonOBX.
function radiobuttonOBX_Callback(hObject, eventdata, handles)
% hObject    handle to radiobuttonOBX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(hObject, 'Value')
        set(handles.checkbox2, 'Value', 0);
        set(handles.checkbox1, 'Value', 0);
        set(handles.checkbox3, 'Value', 0);
        set(handles.checkbox4, 'Value', 0);
        set(handles.checkbox5, 'Value', 0);
        set(handles.checkbox6, 'Value', 0);
 end
set(handles.sonuc,'String','');
set(handles.rotatext,'String','');
axes(handles.axes);
    % axes bileþenini temizle
    cla(handles.axes);
global caprazlamayontemi;
caprazlamayontemi=3;
% Hint: get(hObject,'Value') returns toggle state of radiobuttonOBX

% --- Executes on button press in radiobuttonUCX.
function radiobuttonUCX_Callback(hObject, eventdata, handles)
if get(hObject, 'Value')
        set(handles.checkbox2, 'Value', 0);
        set(handles.checkbox1, 'Value', 0);
        set(handles.checkbox3, 'Value', 0);
        set(handles.checkbox4, 'Value', 0);
        set(handles.checkbox5, 'Value', 0);
        set(handles.checkbox6, 'Value', 0);
 end
set(handles.sonuc,'String','');
set(handles.rotatext,'String','');
axes(handles.axes);
    % axes bileþenini temizle
    cla(handles.axes);
global caprazlamayontemi;
caprazlamayontemi=4;
% hObject    handle to radiobuttonUCX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobuttonUCX
% --- Executes on button press in radiobuttonPBX.
function radiobuttonPBX_Callback(hObject, eventdata, handles)
if get(hObject, 'Value')
       set(handles.checkbox2, 'Value', 0);
        set(handles.checkbox1, 'Value', 0);
        set(handles.checkbox3, 'Value', 0);
        set(handles.checkbox4, 'Value', 0);
        set(handles.checkbox5, 'Value', 0);
        set(handles.checkbox6, 'Value', 0);
 end
set(handles.sonuc,'String','');
set(handles.rotatext,'String','');
axes(handles.axes);
    % axes bileþenini temizle
    cla(handles.axes);
global caprazlamayontemi;
caprazlamayontemi=5;

% --- Executes on button press in radiobuttonOX.
function radiobuttonOX_Callback(hObject, eventdata, handles)
if get(hObject, 'Value')
        set(handles.checkbox2, 'Value', 0);
        set(handles.checkbox1, 'Value', 0);
        set(handles.checkbox3, 'Value', 0);
        set(handles.checkbox4, 'Value', 0);
        set(handles.checkbox5, 'Value', 0);
        set(handles.checkbox6, 'Value', 0);
 end
set(handles.sonuc,'String','');
set(handles.rotatext,'String','');
axes(handles.axes);
% axes bileþenini temizle
cla(handles.axes);
global caprazlamayontemi;
caprazlamayontemi=6;



% --- Executes on slider movement.
function slider_Callback(hObject, eventdata, handles)
% hObject    handle to slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


function edit1_Callback(hObject, eventdata, handles)
%ÝTERAYON SAYISI
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Itersay;
editTextIter = get(handles.edit1, 'String');
Itersay=str2double(editTextIter);
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
%CROSSOVER ORANI
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Crossrate;
editTextCross = get(handles.edit2, 'String');
double_cross=str2double(editTextCross);
Crossrate=double_cross/100;
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



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Mutrate;
editTextMut = get(handles.edit3, 'String');
double_mut=str2double(editTextMut);
Mutrate=double_mut/100;
% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Elitrate;
editTextElit = get(handles.edit4, 'String');
double_elit=str2double(editTextElit);
Elitrate=double_elit/100;
% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in radiobuttonSwap.
function radiobuttonSwap_Callback(hObject, eventdata, handles)
global mutasyonop;
mutasyonop=1;


% --- Executes on button press in radiobuttonInsert.
function radiobuttonInsert_Callback(hObject, eventdata, handles)
global mutasyonop;
mutasyonop=2;


% --- Executes on button press in radiobuttonInverse.
function radiobuttonInverse_Callback(hObject, eventdata, handles)
global mutasyonop;
mutasyonop=3;
