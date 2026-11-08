-- 1. Создаем главную таблицу "Отправители"
CREATE TABLE senders (
    sender_id SERIAL PRIMARY KEY,            -- Автоинкрементный первичный ключ
    last_name VARCHAR(50) NOT NULL,          -- Фамилия
    first_name VARCHAR(50) NOT NULL,         -- Имя
    middle_name VARCHAR(50),                 -- Отчество (может быть пустым)
    address TEXT NOT NULL,                   -- Адрес
    passport_data VARCHAR(20) NOT NULL,      -- Паспортные данные
    phone_number VARCHAR(20)                 -- Контактный телефон
);

-- 2. Создаем зависимую таблицу "Корреспонденция"
CREATE TABLE correspondence (
    track_number VARCHAR(30) PRIMARY KEY,    -- Трек-номер (первичный ключ)
    mail_type_id INTEGER NOT NULL,           -- Код вида корреспонденции
    weight REAL NOT NULL,                    -- Вес (дробный тип REAL вместо numeric)
    length INTEGER NOT NULL,                 -- Длина
    width INTEGER NOT NULL,                  -- Ширина
    height INTEGER NOT NULL,                 -- Высота
    sender_id INTEGER NOT NULL,              -- Внешний ключ
    stamp_amount REAL NOT NULL,              -- Сумма марок (дробный тип REAL)
    
    -- Настройка связи и ограничений целостности (внешний ключ)
    CONSTRAINT fk_sender 
        FOREIGN KEY (sender_id) 
        REFERENCES senders(sender_id) 
        ON UPDATE CASCADE 
        ON DELETE CASCADE
);
