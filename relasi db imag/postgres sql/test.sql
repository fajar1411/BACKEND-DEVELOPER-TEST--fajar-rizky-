PGDMP     3    1                {            test    15.2    15.2                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16398    test    DATABASE     {   CREATE DATABASE test WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_Indonesia.1252';
    DROP DATABASE test;
                postgres    false            �            1259    16414    customer    TABLE     �   CREATE TABLE public.customer (
    cst_id integer NOT NULL,
    nationality_id integer NOT NULL,
    cst_email character varying(50) NOT NULL,
    cst_phonenum character varying(20) NOT NULL,
    cst_dobdate character varying(20) NOT NULL
);
    DROP TABLE public.customer;
       public         heap    postgres    false            �            1259    16413    customer_cst_id_seq    SEQUENCE     �   CREATE SEQUENCE public.customer_cst_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.customer_cst_id_seq;
       public          postgres    false    217                       0    0    customer_cst_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.customer_cst_id_seq OWNED BY public.customer.cst_id;
          public          postgres    false    216            �            1259    16426    family_list    TABLE     �   CREATE TABLE public.family_list (
    fl_id integer NOT NULL,
    cst_id integer NOT NULL,
    fl_relation character varying(50) NOT NULL,
    fl_name character varying(50) NOT NULL,
    fl_dob character varying(50) NOT NULL
);
    DROP TABLE public.family_list;
       public         heap    postgres    false            �            1259    16425    family_list_fl_id_seq    SEQUENCE     �   CREATE SEQUENCE public.family_list_fl_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.family_list_fl_id_seq;
       public          postgres    false    219                       0    0    family_list_fl_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.family_list_fl_id_seq OWNED BY public.family_list.fl_id;
          public          postgres    false    218            �            1259    16407    nationality    TABLE     �   CREATE TABLE public.nationality (
    nationality_id integer NOT NULL,
    nationality_name character varying(50) NOT NULL,
    nationality_code character(2) NOT NULL
);
    DROP TABLE public.nationality;
       public         heap    postgres    false            �            1259    16406    nationality_nationality_id_seq    SEQUENCE     �   CREATE SEQUENCE public.nationality_nationality_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.nationality_nationality_id_seq;
       public          postgres    false    215                       0    0    nationality_nationality_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.nationality_nationality_id_seq OWNED BY public.nationality.nationality_id;
          public          postgres    false    214            p           2604    16417    customer cst_id    DEFAULT     r   ALTER TABLE ONLY public.customer ALTER COLUMN cst_id SET DEFAULT nextval('public.customer_cst_id_seq'::regclass);
 >   ALTER TABLE public.customer ALTER COLUMN cst_id DROP DEFAULT;
       public          postgres    false    216    217    217            q           2604    16429    family_list fl_id    DEFAULT     v   ALTER TABLE ONLY public.family_list ALTER COLUMN fl_id SET DEFAULT nextval('public.family_list_fl_id_seq'::regclass);
 @   ALTER TABLE public.family_list ALTER COLUMN fl_id DROP DEFAULT;
       public          postgres    false    218    219    219            o           2604    16410    nationality nationality_id    DEFAULT     �   ALTER TABLE ONLY public.nationality ALTER COLUMN nationality_id SET DEFAULT nextval('public.nationality_nationality_id_seq'::regclass);
 I   ALTER TABLE public.nationality ALTER COLUMN nationality_id DROP DEFAULT;
       public          postgres    false    215    214    215                      0    16414    customer 
   TABLE DATA           `   COPY public.customer (cst_id, nationality_id, cst_email, cst_phonenum, cst_dobdate) FROM stdin;
    public          postgres    false    217   7                 0    16426    family_list 
   TABLE DATA           R   COPY public.family_list (fl_id, cst_id, fl_relation, fl_name, fl_dob) FROM stdin;
    public          postgres    false    219   T       	          0    16407    nationality 
   TABLE DATA           Y   COPY public.nationality (nationality_id, nationality_name, nationality_code) FROM stdin;
    public          postgres    false    215   q                  0    0    customer_cst_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.customer_cst_id_seq', 1, false);
          public          postgres    false    216                       0    0    family_list_fl_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.family_list_fl_id_seq', 1, false);
          public          postgres    false    218                       0    0    nationality_nationality_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.nationality_nationality_id_seq', 1, false);
          public          postgres    false    214            u           2606    16419    customer customer_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (cst_id);
 @   ALTER TABLE ONLY public.customer DROP CONSTRAINT customer_pkey;
       public            postgres    false    217            w           2606    16431    family_list family_list_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.family_list
    ADD CONSTRAINT family_list_pkey PRIMARY KEY (fl_id);
 F   ALTER TABLE ONLY public.family_list DROP CONSTRAINT family_list_pkey;
       public            postgres    false    219            s           2606    16412    nationality nationality_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.nationality
    ADD CONSTRAINT nationality_pkey PRIMARY KEY (nationality_id);
 F   ALTER TABLE ONLY public.nationality DROP CONSTRAINT nationality_pkey;
       public            postgres    false    215            y           2606    16432    family_list fk_customerfamily    FK CONSTRAINT     �   ALTER TABLE ONLY public.family_list
    ADD CONSTRAINT fk_customerfamily FOREIGN KEY (cst_id) REFERENCES public.customer(cst_id) ON UPDATE CASCADE ON DELETE CASCADE;
 G   ALTER TABLE ONLY public.family_list DROP CONSTRAINT fk_customerfamily;
       public          postgres    false    217    3189    219            x           2606    16420    customer fk_customernationality    FK CONSTRAINT     �   ALTER TABLE ONLY public.customer
    ADD CONSTRAINT fk_customernationality FOREIGN KEY (nationality_id) REFERENCES public.nationality(nationality_id) ON UPDATE CASCADE ON DELETE CASCADE;
 I   ALTER TABLE ONLY public.customer DROP CONSTRAINT fk_customernationality;
       public          postgres    false    3187    217    215                  x������ � �            x������ � �      	      x������ � �     