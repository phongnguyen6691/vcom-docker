--
-- PostgreSQL database dump
--

-- Dumped from database version 14.0
-- Dumped by pg_dump version 14.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: address; Type: TABLE; Schema: public; Owner: ghienan
--

CREATE TABLE public.address (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    "fullName" character varying DEFAULT ''::character varying NOT NULL,
    company character varying DEFAULT ''::character varying NOT NULL,
    "streetLine1" character varying NOT NULL,
    "streetLine2" character varying DEFAULT ''::character varying NOT NULL,
    city character varying DEFAULT ''::character varying NOT NULL,
    province character varying DEFAULT ''::character varying NOT NULL,
    "postalCode" character varying DEFAULT ''::character varying NOT NULL,
    "phoneNumber" character varying DEFAULT ''::character varying NOT NULL,
    "defaultShippingAddress" boolean DEFAULT false NOT NULL,
    "defaultBillingAddress" boolean DEFAULT false NOT NULL,
    id integer NOT NULL,
    "customerId" integer,
    "countryId" integer
);


ALTER TABLE public.address OWNER TO ghienan;

--
-- Name: address_id_seq; Type: SEQUENCE; Schema: public; Owner: ghienan
--

CREATE SEQUENCE public.address_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.address_id_seq OWNER TO ghienan;

--
-- Name: address_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ghienan
--

ALTER SEQUENCE public.address_id_seq OWNED BY public.address.id;


--
-- Name: administrator; Type: TABLE; Schema: public; Owner: ghienan
--

CREATE TABLE public.administrator (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp without time zone,
    "firstName" character varying NOT NULL,
    "lastName" character varying NOT NULL,
    "emailAddress" character varying NOT NULL,
    id integer NOT NULL,
    "userId" integer
);


ALTER TABLE public.administrator OWNER TO ghienan;

--
-- Name: administrator_id_seq; Type: SEQUENCE; Schema: public; Owner: ghienan
--

CREATE SEQUENCE public.administrator_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.administrator_id_seq OWNER TO ghienan;

--
-- Name: administrator_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ghienan
--

ALTER SEQUENCE public.administrator_id_seq OWNED BY public.administrator.id;


--
-- Name: asset; Type: TABLE; Schema: public; Owner: ghienan
--

CREATE TABLE public.asset (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    name character varying NOT NULL,
    type character varying NOT NULL,
    "mimeType" character varying NOT NULL,
    width integer DEFAULT 0 NOT NULL,
    height integer DEFAULT 0 NOT NULL,
    "fileSize" integer NOT NULL,
    source character varying NOT NULL,
    preview character varying NOT NULL,
    "focalPoint" text,
    id integer NOT NULL
);


ALTER TABLE public.asset OWNER TO ghienan;

--
-- Name: asset_channels_channel; Type: TABLE; Schema: public; Owner: ghienan
--

CREATE TABLE public.asset_channels_channel (
    "assetId" integer NOT NULL,
    "channelId" integer NOT NULL
);


ALTER TABLE public.asset_channels_channel OWNER TO ghienan;

--
-- Name: asset_id_seq; Type: SEQUENCE; Schema: public; Owner: ghienan
--

CREATE SEQUENCE public.asset_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asset_id_seq OWNER TO ghienan;

--
-- Name: asset_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ghienan
--

ALTER SEQUENCE public.asset_id_seq OWNED BY public.asset.id;


--
-- Name: asset_tags_tag; Type: TABLE; Schema: public; Owner: ghienan
--

CREATE TABLE public.asset_tags_tag (
    "assetId" integer NOT NULL,
    "tagId" integer NOT NULL
);


ALTER TABLE public.asset_tags_tag OWNER TO ghienan;

--
-- Name: authentication_method; Type: TABLE; Schema: public; Owner: ghienan
--

CREATE TABLE public.authentication_method (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    identifier character varying,
    "passwordHash" character varying,
    "verificationToken" character varying,
    "passwordResetToken" character varying,
    "identifierChangeToken" character varying,
    "pendingIdentifier" character varying,
    strategy character varying,
    "externalIdentifier" character varying,
    metadata text,
    id integer NOT NULL,
    type character varying NOT NULL,
    "userId" integer
);


ALTER TABLE public.authentication_method OWNER TO ghienan;

--
-- Name: authentication_method_id_seq; Type: SEQUENCE; Schema: public; Owner: ghienan
--

CREATE SEQUENCE public.authentication_method_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.authentication_method_id_seq OWNER TO ghienan;

--
-- Name: authentication_method_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ghienan
--

ALTER SEQUENCE public.authentication_method_id_seq OWNED BY public.authentication_method.id;


--
-- Name: channel; Type: TABLE; Schema: public; Owner: ghienan
--

CREATE TABLE public.channel (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    code character varying NOT NULL,
    token character varying NOT NULL,
    "defaultLanguageCode" character varying NOT NULL,
    "currencyCode" character varying NOT NULL,
    "pricesIncludeTax" boolean NOT NULL,
    id integer NOT NULL,
    "defaultTaxZoneId" integer,
    "defaultShippingZoneId" integer
);


ALTER TABLE public.channel OWNER TO ghienan;

--
-- Name: channel_id_seq; Type: SEQUENCE; Schema: public; Owner: ghienan
--

CREATE SEQUENCE public.channel_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.channel_id_seq OWNER TO ghienan;

--
-- Name: channel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ghienan
--

ALTER SEQUENCE public.channel_id_seq OWNED BY public.channel.id;


--
-- Name: collection; Type: TABLE; Schema: public; Owner: ghienan
--

CREATE TABLE public.collection (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    "isRoot" boolean DEFAULT false NOT NULL,
    "position" integer NOT NULL,
    "isPrivate" boolean DEFAULT false NOT NULL,
    filters text NOT NULL,
    id integer NOT NULL,
    "featuredAssetId" integer,
    "parentId" integer
);


ALTER TABLE public.collection OWNER TO ghienan;

--
-- Name: collection_asset; Type: TABLE; Schema: public; Owner: ghienan
--

CREATE TABLE public.collection_asset (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    "assetId" integer NOT NULL,
    "position" integer NOT NULL,
    "collectionId" integer NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.collection_asset OWNER TO ghienan;

--
-- Name: collection_asset_id_seq; Type: SEQUENCE; Schema: public; Owner: ghienan
--

CREATE SEQUENCE public.collection_asset_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.collection_asset_id_seq OWNER TO ghienan;

--
-- Name: collection_asset_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ghienan
--

ALTER SEQUENCE public.collection_asset_id_seq OWNED BY public.collection_asset.id;


--
-- Name: collection_channels_channel; Type: TABLE; Schema: public; Owner: ghienan
--

CREATE TABLE public.collection_channels_channel (
    "collectionId" integer NOT NULL,
    "channelId" integer NOT NULL
);


ALTER TABLE public.collection_channels_channel OWNER TO ghienan;

--
-- Name: collection_id_seq; Type: SEQUENCE; Schema: public; Owner: ghienan
--

CREATE SEQUENCE public.collection_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.collection_id_seq OWNER TO ghienan;

--
-- Name: collection_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ghienan
--

ALTER SEQUENCE public.collection_id_seq OWNED BY public.collection.id;


--
-- Name: collection_product_variants_product_variant; Type: TABLE; Schema: public; Owner: ghienan
--

CREATE TABLE public.collection_product_variants_product_variant (
    "collectionId" integer NOT NULL,
    "productVariantId" integer NOT NULL
);


ALTER TABLE public.collection_product_variants_product_variant OWNER TO ghienan;

--
-- Name: collection_translation; Type: TABLE; Schema: public; Owner: ghienan
--

CREATE TABLE public.collection_translation (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    "languageCode" character varying NOT NULL,
    name character varying NOT NULL,
    slug character varying NOT NULL,
    description text NOT NULL,
    id integer NOT NULL,
    "baseId" integer
);


ALTER TABLE public.collection_translation OWNER TO ghienan;

--
-- Name: collection_translation_id_seq; Type: SEQUENCE; Schema: public; Owner: ghienan
--

CREATE SEQUENCE public.collection_translation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.collection_translation_id_seq OWNER TO ghienan;

--
-- Name: collection_translation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ghienan
--

ALTER SEQUENCE public.collection_translation_id_seq OWNED BY public.collection_translation.id;


--
-- Name: country; Type: TABLE; Schema: public; Owner: ghienan
--

CREATE TABLE public.country (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    code character varying NOT NULL,
    enabled boolean NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.country OWNER TO ghienan;

--
-- Name: country_id_seq; Type: SEQUENCE; Schema: public; Owner: ghienan
--

CREATE SEQUENCE public.country_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.country_id_seq OWNER TO ghienan;

--
-- Name: country_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ghienan
--

ALTER SEQUENCE public.country_id_seq OWNED BY public.country.id;


--
-- Name: country_translation; Type: TABLE; Schema: public; Owner: ghienan
--

CREATE TABLE public.country_translation (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    "languageCode" character varying NOT NULL,
    name character varying NOT NULL,
    id integer NOT NULL,
    "baseId" integer
);


ALTER TABLE public.country_translation OWNER TO ghienan;

--
-- Name: country_translation_id_seq; Type: SEQUENCE; Schema: public; Owner: ghienan
--

CREATE SEQUENCE public.country_translation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.country_translation_id_seq OWNER TO ghienan;

--
-- Name: country_translation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ghienan
--

ALTER SEQUENCE public.country_translation_id_seq OWNED BY public.country_translation.id;


--
-- Name: customer; Type: TABLE; Schema: public; Owner: ghienan
--

CREATE TABLE public.customer (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp without time zone,
    title character varying,
    "firstName" character varying NOT NULL,
    "lastName" character varying NOT NULL,
    "phoneNumber" character varying,
    "emailAddress" character varying NOT NULL,
    id integer NOT NULL,
    "userId" integer
);


ALTER TABLE public.customer OWNER TO ghienan;

--
-- Name: customer_channels_channel; Type: TABLE; Schema: public; Owner: ghienan
--

CREATE TABLE public.customer_channels_channel (
    "customerId" integer NOT NULL,
    "channelId" integer NOT NULL
);


ALTER TABLE public.customer_channels_channel OWNER TO ghienan;

--
-- Name: customer_group; Type: TABLE; Schema: public; Owner: ghienan
--

CREATE TABLE public.customer_group (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    name character varying NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.customer_group OWNER TO ghienan;

--
-- Name: customer_group_id_seq; Type: SEQUENCE; Schema: public; Owner: ghienan
--

CREATE SEQUENCE public.customer_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customer_group_id_seq OWNER TO ghienan;

--
-- Name: customer_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ghienan
--

ALTER SEQUENCE public.customer_group_id_seq OWNED BY public.customer_group.id;


--
-- Name: customer_groups_customer_group; Type: TABLE; Schema: public; Owner: ghienan
--

CREATE TABLE public.customer_groups_customer_group (
    "customerId" integer NOT NULL,
    "customerGroupId" integer NOT NULL
);


ALTER TABLE public.customer_groups_customer_group OWNER TO ghienan;

--
-- Name: customer_id_seq; Type: SEQUENCE; Schema: public; Owner: ghienan
--

CREATE SEQUENCE public.customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customer_id_seq OWNER TO ghienan;

--
-- Name: customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ghienan
--

ALTER SEQUENCE public.customer_id_seq OWNED BY public.customer.id;


--
-- Name: facet; Type: TABLE; Schema: public; Owner: ghienan
--

CREATE TABLE public.facet (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    "isPrivate" boolean DEFAULT false NOT NULL,
    code character varying NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.facet OWNER TO ghienan;

--
-- Name: facet_channels_channel; Type: TABLE; Schema: public; Owner: ghienan
--

CREATE TABLE public.facet_channels_channel (
    "facetId" integer NOT NULL,
    "channelId" integer NOT NULL
);


ALTER TABLE public.facet_channels_channel OWNER TO ghienan;

--
-- Name: facet_id_seq; Type: SEQUENCE; Schema: public; Owner: ghienan
--

CREATE SEQUENCE public.facet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.facet_id_seq OWNER TO ghienan;

--
-- Name: facet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ghienan
--

ALTER SEQUENCE public.facet_id_seq OWNED BY public.facet.id;


--
-- Name: facet_translation; Type: TABLE; Schema: public; Owner: ghienan
--

CREATE TABLE public.facet_translation (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    "languageCode" character varying NOT NULL,
    name character varying NOT NULL,
    id integer NOT NULL,
    "baseId" integer
);


ALTER TABLE public.facet_translation OWNER TO ghienan;

--
-- Name: facet_translation_id_seq; Type: SEQUENCE; Schema: public; Owner: ghienan
--

CREATE SEQUENCE public.facet_translation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.facet_translation_id_seq OWNER TO ghienan;

--
-- Name: facet_translation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ghienan
--

ALTER SEQUENCE public.facet_translation_id_seq OWNED BY public.facet_translation.id;


--
-- Name: facet_value; Type: TABLE; Schema: public; Owner: ghienan
--

CREATE TABLE public.facet_value (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    code character varying NOT NULL,
    id integer NOT NULL,
    "facetId" integer
);


ALTER TABLE public.facet_value OWNER TO ghienan;

--
-- Name: facet_value_channels_channel; Type: TABLE; Schema: public; Owner: ghienan
--

CREATE TABLE public.facet_value_channels_channel (
    "facetValueId" integer NOT NULL,
    "channelId" integer NOT NULL
);


ALTER TABLE public.facet_value_channels_channel OWNER TO ghienan;

--
-- Name: facet_value_id_seq; Type: SEQUENCE; Schema: public; Owner: ghienan
--

CREATE SEQUENCE public.facet_value_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.facet_value_id_seq OWNER TO ghienan;

--
-- Name: facet_value_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ghienan
--

ALTER SEQUENCE public.facet_value_id_seq OWNED BY public.facet_value.id;


--
-- Name: facet_value_translation; Type: TABLE; Schema: public; Owner: ghienan
--

CREATE TABLE public.facet_value_translation (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    "languageCode" character varying NOT NULL,
    name character varying NOT NULL,
    id integer NOT NULL,
    "baseId" integer
);


ALTER TABLE public.facet_value_translation OWNER TO ghienan;

--
-- Name: facet_value_translation_id_seq; Type: SEQUENCE; Schema: public; Owner: ghienan
--

CREATE SEQUENCE public.facet_value_translation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.facet_value_translation_id_seq OWNER TO ghienan;

--
-- Name: facet_value_translation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ghienan
--

ALTER SEQUENCE public.facet_value_translation_id_seq OWNED BY public.facet_value_translation.id;


--
-- Name: fulfillment; Type: TABLE; Schema: public; Owner: ghienan
--

CREATE TABLE public.fulfillment (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    state character varying NOT NULL,
    "trackingCode" character varying DEFAULT ''::character varying NOT NULL,
    method character varying NOT NULL,
    "handlerCode" character varying NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.fulfillment OWNER TO ghienan;

--
-- Name: fulfillment_id_seq; Type: SEQUENCE; Schema: public; Owner: ghienan
--

CREATE SEQUENCE public.fulfillment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fulfillment_id_seq OWNER TO ghienan;

--
-- Name: fulfillment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ghienan
--

ALTER SEQUENCE public.fulfillment_id_seq OWNED BY public.fulfillment.id;


--
-- Name: global_settings; Type: TABLE; Schema: public; Owner: ghienan
--

CREATE TABLE public.global_settings (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    "availableLanguages" text NOT NULL,
    "trackInventory" boolean DEFAULT true NOT NULL,
    "outOfStockThreshold" integer DEFAULT 0 NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.global_settings OWNER TO ghienan;

--
-- Name: global_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: ghienan
--

CREATE SEQUENCE public.global_settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.global_settings_id_seq OWNER TO ghienan;

--
-- Name: global_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ghienan
--

ALTER SEQUENCE public.global_settings_id_seq OWNED BY public.global_settings.id;


--
-- Name: history_entry; Type: TABLE; Schema: public; Owner: ghienan
--

CREATE TABLE public.history_entry (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    type character varying NOT NULL,
    "isPublic" boolean NOT NULL,
    data text NOT NULL,
    id integer NOT NULL,
    discriminator character varying NOT NULL,
    "administratorId" integer,
    "customerId" integer,
    "orderId" integer
);


ALTER TABLE public.history_entry OWNER TO ghienan;

--
-- Name: history_entry_id_seq; Type: SEQUENCE; Schema: public; Owner: ghienan
--

CREATE SEQUENCE public.history_entry_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.history_entry_id_seq OWNER TO ghienan;

--
-- Name: history_entry_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ghienan
--

ALTER SEQUENCE public.history_entry_id_seq OWNED BY public.history_entry.id;


--
-- Name: job_record; Type: TABLE; Schema: public; Owner: ghienan
--

CREATE TABLE public.job_record (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    "queueName" character varying NOT NULL,
    data text,
    state character varying NOT NULL,
    progress integer NOT NULL,
    result text,
    error character varying,
    "startedAt" timestamp(6) without time zone,
    "settledAt" timestamp(6) without time zone,
    "isSettled" boolean NOT NULL,
    retries integer NOT NULL,
    attempts integer NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.job_record OWNER TO ghienan;

--
-- Name: job_record_buffer; Type: TABLE; Schema: public; Owner: ghienan
--

CREATE TABLE public.job_record_buffer (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    "bufferId" character varying NOT NULL,
    job text NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.job_record_buffer OWNER TO ghienan;

--
-- Name: job_record_buffer_id_seq; Type: SEQUENCE; Schema: public; Owner: ghienan
--

CREATE SEQUENCE public.job_record_buffer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.job_record_buffer_id_seq OWNER TO ghienan;

--
-- Name: job_record_buffer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ghienan
--

ALTER SEQUENCE public.job_record_buffer_id_seq OWNED BY public.job_record_buffer.id;


--
-- Name: job_record_id_seq; Type: SEQUENCE; Schema: public; Owner: ghienan
--

CREATE SEQUENCE public.job_record_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.job_record_id_seq OWNER TO ghienan;

--
-- Name: job_record_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ghienan
--

ALTER SEQUENCE public.job_record_id_seq OWNED BY public.job_record.id;


--
-- Name: order; Type: TABLE; Schema: public; Owner: ghienan
--

CREATE TABLE public."order" (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    code character varying NOT NULL,
    state character varying NOT NULL,
    active boolean DEFAULT true NOT NULL,
    "orderPlacedAt" timestamp without time zone,
    "couponCodes" text NOT NULL,
    "shippingAddress" text NOT NULL,
    "billingAddress" text NOT NULL,
    "currencyCode" character varying NOT NULL,
    "subTotal" integer NOT NULL,
    "subTotalWithTax" integer NOT NULL,
    shipping integer DEFAULT 0 NOT NULL,
    "shippingWithTax" integer DEFAULT 0 NOT NULL,
    id integer NOT NULL,
    "taxZoneId" integer,
    "customerId" integer
);


ALTER TABLE public."order" OWNER TO ghienan;

--
-- Name: order_channels_channel; Type: TABLE; Schema: public; Owner: ghienan
--

CREATE TABLE public.order_channels_channel (
    "orderId" integer NOT NULL,
    "channelId" integer NOT NULL
);


ALTER TABLE public.order_channels_channel OWNER TO ghienan;

--
-- Name: order_id_seq; Type: SEQUENCE; Schema: public; Owner: ghienan
--

CREATE SEQUENCE public.order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_id_seq OWNER TO ghienan;

--
-- Name: order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ghienan
--

ALTER SEQUENCE public.order_id_seq OWNED BY public."order".id;


--
-- Name: order_item; Type: TABLE; Schema: public; Owner: ghienan
--

CREATE TABLE public.order_item (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    "initialListPrice" integer,
    "listPrice" integer NOT NULL,
    "listPriceIncludesTax" boolean NOT NULL,
    adjustments text NOT NULL,
    "taxLines" text NOT NULL,
    cancelled boolean DEFAULT false NOT NULL,
    id integer NOT NULL,
    "lineId" integer NOT NULL,
    "refundId" integer
);


ALTER TABLE public.order_item OWNER TO ghienan;

--
-- Name: order_item_fulfillments_fulfillment; Type: TABLE; Schema: public; Owner: ghienan
--

CREATE TABLE public.order_item_fulfillments_fulfillment (
    "orderItemId" integer NOT NULL,
    "fulfillmentId" integer NOT NULL
);


ALTER TABLE public.order_item_fulfillments_fulfillment OWNER TO ghienan;

--
-- Name: order_item_id_seq; Type: SEQUENCE; Schema: public; Owner: ghienan
--

CREATE SEQUENCE public.order_item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_item_id_seq OWNER TO ghienan;

--
-- Name: order_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ghienan
--

ALTER SEQUENCE public.order_item_id_seq OWNED BY public.order_item.id;


--
-- Name: order_line; Type: TABLE; Schema: public; Owner: ghienan
--

CREATE TABLE public.order_line (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    id integer NOT NULL,
    "productVariantId" integer,
    "taxCategoryId" integer,
    "featuredAssetId" integer,
    "orderId" integer
);


ALTER TABLE public.order_line OWNER TO ghienan;

--
-- Name: order_line_id_seq; Type: SEQUENCE; Schema: public; Owner: ghienan
--

CREATE SEQUENCE public.order_line_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_line_id_seq OWNER TO ghienan;

--
-- Name: order_line_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ghienan
--

ALTER SEQUENCE public.order_line_id_seq OWNED BY public.order_line.id;


--
-- Name: order_modification; Type: TABLE; Schema: public; Owner: ghienan
--

CREATE TABLE public.order_modification (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    note character varying NOT NULL,
    "priceChange" integer NOT NULL,
    "shippingAddressChange" text,
    "billingAddressChange" text,
    id integer NOT NULL,
    "orderId" integer,
    "paymentId" integer,
    "refundId" integer
);


ALTER TABLE public.order_modification OWNER TO ghienan;

--
-- Name: order_modification_id_seq; Type: SEQUENCE; Schema: public; Owner: ghienan
--

CREATE SEQUENCE public.order_modification_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_modification_id_seq OWNER TO ghienan;

--
-- Name: order_modification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ghienan
--

ALTER SEQUENCE public.order_modification_id_seq OWNED BY public.order_modification.id;


--
-- Name: order_modification_order_items_order_item; Type: TABLE; Schema: public; Owner: ghienan
--

CREATE TABLE public.order_modification_order_items_order_item (
    "orderModificationId" integer NOT NULL,
    "orderItemId" integer NOT NULL
);


ALTER TABLE public.order_modification_order_items_order_item OWNER TO ghienan;

--
-- Name: order_promotions_promotion; Type: TABLE; Schema: public; Owner: ghienan
--

CREATE TABLE public.order_promotions_promotion (
    "orderId" integer NOT NULL,
    "promotionId" integer NOT NULL
);


ALTER TABLE public.order_promotions_promotion OWNER TO ghienan;

--
-- Name: payment; Type: TABLE; Schema: public; Owner: ghienan
--

CREATE TABLE public.payment (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    method character varying NOT NULL,
    amount integer NOT NULL,
    state character varying NOT NULL,
    "errorMessage" character varying,
    "transactionId" character varying,
    metadata text NOT NULL,
    id integer NOT NULL,
    "orderId" integer
);


ALTER TABLE public.payment OWNER TO ghienan;

--
-- Name: payment_id_seq; Type: SEQUENCE; Schema: public; Owner: ghienan
--

CREATE SEQUENCE public.payment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payment_id_seq OWNER TO ghienan;

--
-- Name: payment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ghienan
--

ALTER SEQUENCE public.payment_id_seq OWNED BY public.payment.id;


--
-- Name: payment_method; Type: TABLE; Schema: public; Owner: ghienan
--

CREATE TABLE public.payment_method (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    name character varying DEFAULT ''::character varying NOT NULL,
    code character varying DEFAULT ''::character varying NOT NULL,
    description character varying DEFAULT ''::character varying NOT NULL,
    enabled boolean NOT NULL,
    checker text,
    handler text NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.payment_method OWNER TO ghienan;

--
-- Name: payment_method_channels_channel; Type: TABLE; Schema: public; Owner: ghienan
--

CREATE TABLE public.payment_method_channels_channel (
    "paymentMethodId" integer NOT NULL,
    "channelId" integer NOT NULL
);


ALTER TABLE public.payment_method_channels_channel OWNER TO ghienan;

--
-- Name: payment_method_id_seq; Type: SEQUENCE; Schema: public; Owner: ghienan
--

CREATE SEQUENCE public.payment_method_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payment_method_id_seq OWNER TO ghienan;

--
-- Name: payment_method_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ghienan
--

ALTER SEQUENCE public.payment_method_id_seq OWNED BY public.payment_method.id;


--
-- Name: product; Type: TABLE; Schema: public; Owner: ghienan
--

CREATE TABLE public.product (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp without time zone,
    enabled boolean DEFAULT true NOT NULL,
    id integer NOT NULL,
    "featuredAssetId" integer
);


ALTER TABLE public.product OWNER TO ghienan;

--
-- Name: product_asset; Type: TABLE; Schema: public; Owner: ghienan
--

CREATE TABLE public.product_asset (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    "assetId" integer NOT NULL,
    "position" integer NOT NULL,
    "productId" integer NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.product_asset OWNER TO ghienan;

--
-- Name: product_asset_id_seq; Type: SEQUENCE; Schema: public; Owner: ghienan
--

CREATE SEQUENCE public.product_asset_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_asset_id_seq OWNER TO ghienan;

--
-- Name: product_asset_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ghienan
--

ALTER SEQUENCE public.product_asset_id_seq OWNED BY public.product_asset.id;


--
-- Name: product_channels_channel; Type: TABLE; Schema: public; Owner: ghienan
--

CREATE TABLE public.product_channels_channel (
    "productId" integer NOT NULL,
    "channelId" integer NOT NULL
);


ALTER TABLE public.product_channels_channel OWNER TO ghienan;

--
-- Name: product_facet_values_facet_value; Type: TABLE; Schema: public; Owner: ghienan
--

CREATE TABLE public.product_facet_values_facet_value (
    "productId" integer NOT NULL,
    "facetValueId" integer NOT NULL
);


ALTER TABLE public.product_facet_values_facet_value OWNER TO ghienan;

--
-- Name: product_id_seq; Type: SEQUENCE; Schema: public; Owner: ghienan
--

CREATE SEQUENCE public.product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_id_seq OWNER TO ghienan;

--
-- Name: product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ghienan
--

ALTER SEQUENCE public.product_id_seq OWNED BY public.product.id;


--
-- Name: product_option; Type: TABLE; Schema: public; Owner: ghienan
--

CREATE TABLE public.product_option (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp without time zone,
    code character varying NOT NULL,
    id integer NOT NULL,
    "groupId" integer NOT NULL
);


ALTER TABLE public.product_option OWNER TO ghienan;

--
-- Name: product_option_group; Type: TABLE; Schema: public; Owner: ghienan
--

CREATE TABLE public.product_option_group (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp without time zone,
    code character varying NOT NULL,
    id integer NOT NULL,
    "productId" integer
);


ALTER TABLE public.product_option_group OWNER TO ghienan;

--
-- Name: product_option_group_id_seq; Type: SEQUENCE; Schema: public; Owner: ghienan
--

CREATE SEQUENCE public.product_option_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_option_group_id_seq OWNER TO ghienan;

--
-- Name: product_option_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ghienan
--

ALTER SEQUENCE public.product_option_group_id_seq OWNED BY public.product_option_group.id;


--
-- Name: product_option_group_translation; Type: TABLE; Schema: public; Owner: ghienan
--

CREATE TABLE public.product_option_group_translation (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    "languageCode" character varying NOT NULL,
    name character varying NOT NULL,
    id integer NOT NULL,
    "baseId" integer
);


ALTER TABLE public.product_option_group_translation OWNER TO ghienan;

--
-- Name: product_option_group_translation_id_seq; Type: SEQUENCE; Schema: public; Owner: ghienan
--

CREATE SEQUENCE public.product_option_group_translation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_option_group_translation_id_seq OWNER TO ghienan;

--
-- Name: product_option_group_translation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ghienan
--

ALTER SEQUENCE public.product_option_group_translation_id_seq OWNED BY public.product_option_group_translation.id;


--
-- Name: product_option_id_seq; Type: SEQUENCE; Schema: public; Owner: ghienan
--

CREATE SEQUENCE public.product_option_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_option_id_seq OWNER TO ghienan;

--
-- Name: product_option_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ghienan
--

ALTER SEQUENCE public.product_option_id_seq OWNED BY public.product_option.id;


--
-- Name: product_option_translation; Type: TABLE; Schema: public; Owner: ghienan
--

CREATE TABLE public.product_option_translation (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    "languageCode" character varying NOT NULL,
    name character varying NOT NULL,
    id integer NOT NULL,
    "baseId" integer
);


ALTER TABLE public.product_option_translation OWNER TO ghienan;

--
-- Name: product_option_translation_id_seq; Type: SEQUENCE; Schema: public; Owner: ghienan
--

CREATE SEQUENCE public.product_option_translation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_option_translation_id_seq OWNER TO ghienan;

--
-- Name: product_option_translation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ghienan
--

ALTER SEQUENCE public.product_option_translation_id_seq OWNED BY public.product_option_translation.id;


--
-- Name: product_translation; Type: TABLE; Schema: public; Owner: ghienan
--

CREATE TABLE public.product_translation (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    "languageCode" character varying NOT NULL,
    name character varying NOT NULL,
    slug character varying NOT NULL,
    description text NOT NULL,
    id integer NOT NULL,
    "baseId" integer
);


ALTER TABLE public.product_translation OWNER TO ghienan;

--
-- Name: product_translation_id_seq; Type: SEQUENCE; Schema: public; Owner: ghienan
--

CREATE SEQUENCE public.product_translation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_translation_id_seq OWNER TO ghienan;

--
-- Name: product_translation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ghienan
--

ALTER SEQUENCE public.product_translation_id_seq OWNED BY public.product_translation.id;


--
-- Name: product_variant; Type: TABLE; Schema: public; Owner: ghienan
--

CREATE TABLE public.product_variant (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp without time zone,
    enabled boolean DEFAULT true NOT NULL,
    sku character varying NOT NULL,
    "stockOnHand" integer DEFAULT 0 NOT NULL,
    "stockAllocated" integer DEFAULT 0 NOT NULL,
    "outOfStockThreshold" integer DEFAULT 0 NOT NULL,
    "useGlobalOutOfStockThreshold" boolean DEFAULT true NOT NULL,
    "trackInventory" character varying DEFAULT 'INHERIT'::character varying NOT NULL,
    id integer NOT NULL,
    "productId" integer,
    "featuredAssetId" integer,
    "taxCategoryId" integer
);


ALTER TABLE public.product_variant OWNER TO ghienan;

--
-- Name: product_variant_asset; Type: TABLE; Schema: public; Owner: ghienan
--

CREATE TABLE public.product_variant_asset (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    "assetId" integer NOT NULL,
    "position" integer NOT NULL,
    "productVariantId" integer NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.product_variant_asset OWNER TO ghienan;

--
-- Name: product_variant_asset_id_seq; Type: SEQUENCE; Schema: public; Owner: ghienan
--

CREATE SEQUENCE public.product_variant_asset_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_variant_asset_id_seq OWNER TO ghienan;

--
-- Name: product_variant_asset_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ghienan
--

ALTER SEQUENCE public.product_variant_asset_id_seq OWNED BY public.product_variant_asset.id;


--
-- Name: product_variant_channels_channel; Type: TABLE; Schema: public; Owner: ghienan
--

CREATE TABLE public.product_variant_channels_channel (
    "productVariantId" integer NOT NULL,
    "channelId" integer NOT NULL
);


ALTER TABLE public.product_variant_channels_channel OWNER TO ghienan;

--
-- Name: product_variant_facet_values_facet_value; Type: TABLE; Schema: public; Owner: ghienan
--

CREATE TABLE public.product_variant_facet_values_facet_value (
    "productVariantId" integer NOT NULL,
    "facetValueId" integer NOT NULL
);


ALTER TABLE public.product_variant_facet_values_facet_value OWNER TO ghienan;

--
-- Name: product_variant_id_seq; Type: SEQUENCE; Schema: public; Owner: ghienan
--

CREATE SEQUENCE public.product_variant_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_variant_id_seq OWNER TO ghienan;

--
-- Name: product_variant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ghienan
--

ALTER SEQUENCE public.product_variant_id_seq OWNED BY public.product_variant.id;


--
-- Name: product_variant_options_product_option; Type: TABLE; Schema: public; Owner: ghienan
--

CREATE TABLE public.product_variant_options_product_option (
    "productVariantId" integer NOT NULL,
    "productOptionId" integer NOT NULL
);


ALTER TABLE public.product_variant_options_product_option OWNER TO ghienan;

--
-- Name: product_variant_price; Type: TABLE; Schema: public; Owner: ghienan
--

CREATE TABLE public.product_variant_price (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    price integer NOT NULL,
    id integer NOT NULL,
    "channelId" integer NOT NULL,
    "variantId" integer
);


ALTER TABLE public.product_variant_price OWNER TO ghienan;

--
-- Name: product_variant_price_id_seq; Type: SEQUENCE; Schema: public; Owner: ghienan
--

CREATE SEQUENCE public.product_variant_price_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_variant_price_id_seq OWNER TO ghienan;

--
-- Name: product_variant_price_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ghienan
--

ALTER SEQUENCE public.product_variant_price_id_seq OWNED BY public.product_variant_price.id;


--
-- Name: product_variant_translation; Type: TABLE; Schema: public; Owner: ghienan
--

CREATE TABLE public.product_variant_translation (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    "languageCode" character varying NOT NULL,
    name character varying NOT NULL,
    id integer NOT NULL,
    "baseId" integer
);


ALTER TABLE public.product_variant_translation OWNER TO ghienan;

--
-- Name: product_variant_translation_id_seq; Type: SEQUENCE; Schema: public; Owner: ghienan
--

CREATE SEQUENCE public.product_variant_translation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_variant_translation_id_seq OWNER TO ghienan;

--
-- Name: product_variant_translation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ghienan
--

ALTER SEQUENCE public.product_variant_translation_id_seq OWNED BY public.product_variant_translation.id;


--
-- Name: promotion; Type: TABLE; Schema: public; Owner: ghienan
--

CREATE TABLE public.promotion (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp without time zone,
    "startsAt" timestamp without time zone,
    "endsAt" timestamp without time zone,
    "couponCode" character varying,
    "perCustomerUsageLimit" integer,
    name character varying NOT NULL,
    enabled boolean NOT NULL,
    conditions text NOT NULL,
    actions text NOT NULL,
    "priorityScore" integer NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.promotion OWNER TO ghienan;

--
-- Name: promotion_channels_channel; Type: TABLE; Schema: public; Owner: ghienan
--

CREATE TABLE public.promotion_channels_channel (
    "promotionId" integer NOT NULL,
    "channelId" integer NOT NULL
);


ALTER TABLE public.promotion_channels_channel OWNER TO ghienan;

--
-- Name: promotion_id_seq; Type: SEQUENCE; Schema: public; Owner: ghienan
--

CREATE SEQUENCE public.promotion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.promotion_id_seq OWNER TO ghienan;

--
-- Name: promotion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ghienan
--

ALTER SEQUENCE public.promotion_id_seq OWNED BY public.promotion.id;


--
-- Name: refund; Type: TABLE; Schema: public; Owner: ghienan
--

CREATE TABLE public.refund (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    items integer NOT NULL,
    shipping integer NOT NULL,
    adjustment integer NOT NULL,
    total integer NOT NULL,
    method character varying NOT NULL,
    reason character varying,
    state character varying NOT NULL,
    "transactionId" character varying,
    metadata text NOT NULL,
    id integer NOT NULL,
    "paymentId" integer NOT NULL
);


ALTER TABLE public.refund OWNER TO ghienan;

--
-- Name: refund_id_seq; Type: SEQUENCE; Schema: public; Owner: ghienan
--

CREATE SEQUENCE public.refund_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.refund_id_seq OWNER TO ghienan;

--
-- Name: refund_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ghienan
--

ALTER SEQUENCE public.refund_id_seq OWNED BY public.refund.id;


--
-- Name: role; Type: TABLE; Schema: public; Owner: ghienan
--

CREATE TABLE public.role (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    code character varying NOT NULL,
    description character varying NOT NULL,
    permissions text NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.role OWNER TO ghienan;

--
-- Name: role_channels_channel; Type: TABLE; Schema: public; Owner: ghienan
--

CREATE TABLE public.role_channels_channel (
    "roleId" integer NOT NULL,
    "channelId" integer NOT NULL
);


ALTER TABLE public.role_channels_channel OWNER TO ghienan;

--
-- Name: role_id_seq; Type: SEQUENCE; Schema: public; Owner: ghienan
--

CREATE SEQUENCE public.role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.role_id_seq OWNER TO ghienan;

--
-- Name: role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ghienan
--

ALTER SEQUENCE public.role_id_seq OWNED BY public.role.id;


--
-- Name: search_index_item; Type: TABLE; Schema: public; Owner: ghienan
--

CREATE TABLE public.search_index_item (
    "languageCode" character varying NOT NULL,
    enabled boolean NOT NULL,
    "productName" character varying NOT NULL,
    "productVariantName" character varying NOT NULL,
    description text NOT NULL,
    slug character varying NOT NULL,
    sku character varying NOT NULL,
    price integer NOT NULL,
    "priceWithTax" integer NOT NULL,
    "facetIds" text NOT NULL,
    "facetValueIds" text NOT NULL,
    "collectionIds" text NOT NULL,
    "collectionSlugs" text NOT NULL,
    "channelIds" text NOT NULL,
    "productPreview" character varying NOT NULL,
    "productPreviewFocalPoint" text,
    "productVariantPreview" character varying NOT NULL,
    "productVariantPreviewFocalPoint" text,
    "inStock" boolean DEFAULT true NOT NULL,
    "productInStock" boolean DEFAULT true NOT NULL,
    "productVariantId" integer NOT NULL,
    "channelId" integer NOT NULL,
    "productId" integer NOT NULL,
    "productAssetId" integer,
    "productVariantAssetId" integer
);


ALTER TABLE public.search_index_item OWNER TO ghienan;

--
-- Name: session; Type: TABLE; Schema: public; Owner: ghienan
--

CREATE TABLE public.session (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    token character varying NOT NULL,
    expires timestamp without time zone NOT NULL,
    invalidated boolean NOT NULL,
    "authenticationStrategy" character varying,
    id integer NOT NULL,
    "activeOrderId" integer,
    "activeChannelId" integer,
    type character varying NOT NULL,
    "userId" integer
);


ALTER TABLE public.session OWNER TO ghienan;

--
-- Name: session_id_seq; Type: SEQUENCE; Schema: public; Owner: ghienan
--

CREATE SEQUENCE public.session_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.session_id_seq OWNER TO ghienan;

--
-- Name: session_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ghienan
--

ALTER SEQUENCE public.session_id_seq OWNED BY public.session.id;


--
-- Name: shipping_line; Type: TABLE; Schema: public; Owner: ghienan
--

CREATE TABLE public.shipping_line (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    "listPrice" integer NOT NULL,
    "listPriceIncludesTax" boolean NOT NULL,
    adjustments text NOT NULL,
    "taxLines" text NOT NULL,
    id integer NOT NULL,
    "shippingMethodId" integer NOT NULL,
    "orderId" integer
);


ALTER TABLE public.shipping_line OWNER TO ghienan;

--
-- Name: shipping_line_id_seq; Type: SEQUENCE; Schema: public; Owner: ghienan
--

CREATE SEQUENCE public.shipping_line_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shipping_line_id_seq OWNER TO ghienan;

--
-- Name: shipping_line_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ghienan
--

ALTER SEQUENCE public.shipping_line_id_seq OWNED BY public.shipping_line.id;


--
-- Name: shipping_method; Type: TABLE; Schema: public; Owner: ghienan
--

CREATE TABLE public.shipping_method (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp without time zone,
    code character varying NOT NULL,
    checker text NOT NULL,
    calculator text NOT NULL,
    "fulfillmentHandlerCode" character varying NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.shipping_method OWNER TO ghienan;

--
-- Name: shipping_method_channels_channel; Type: TABLE; Schema: public; Owner: ghienan
--

CREATE TABLE public.shipping_method_channels_channel (
    "shippingMethodId" integer NOT NULL,
    "channelId" integer NOT NULL
);


ALTER TABLE public.shipping_method_channels_channel OWNER TO ghienan;

--
-- Name: shipping_method_id_seq; Type: SEQUENCE; Schema: public; Owner: ghienan
--

CREATE SEQUENCE public.shipping_method_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shipping_method_id_seq OWNER TO ghienan;

--
-- Name: shipping_method_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ghienan
--

ALTER SEQUENCE public.shipping_method_id_seq OWNED BY public.shipping_method.id;


--
-- Name: shipping_method_translation; Type: TABLE; Schema: public; Owner: ghienan
--

CREATE TABLE public.shipping_method_translation (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    "languageCode" character varying NOT NULL,
    name character varying DEFAULT ''::character varying NOT NULL,
    description character varying DEFAULT ''::character varying NOT NULL,
    id integer NOT NULL,
    "baseId" integer
);


ALTER TABLE public.shipping_method_translation OWNER TO ghienan;

--
-- Name: shipping_method_translation_id_seq; Type: SEQUENCE; Schema: public; Owner: ghienan
--

CREATE SEQUENCE public.shipping_method_translation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shipping_method_translation_id_seq OWNER TO ghienan;

--
-- Name: shipping_method_translation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ghienan
--

ALTER SEQUENCE public.shipping_method_translation_id_seq OWNED BY public.shipping_method_translation.id;


--
-- Name: stock_movement; Type: TABLE; Schema: public; Owner: ghienan
--

CREATE TABLE public.stock_movement (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    type character varying NOT NULL,
    quantity integer NOT NULL,
    id integer NOT NULL,
    discriminator character varying NOT NULL,
    "productVariantId" integer,
    "orderItemId" integer,
    "orderLineId" integer
);


ALTER TABLE public.stock_movement OWNER TO ghienan;

--
-- Name: stock_movement_id_seq; Type: SEQUENCE; Schema: public; Owner: ghienan
--

CREATE SEQUENCE public.stock_movement_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stock_movement_id_seq OWNER TO ghienan;

--
-- Name: stock_movement_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ghienan
--

ALTER SEQUENCE public.stock_movement_id_seq OWNED BY public.stock_movement.id;


--
-- Name: surcharge; Type: TABLE; Schema: public; Owner: ghienan
--

CREATE TABLE public.surcharge (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    description character varying NOT NULL,
    "listPrice" integer NOT NULL,
    "listPriceIncludesTax" boolean NOT NULL,
    sku character varying NOT NULL,
    "taxLines" text NOT NULL,
    id integer NOT NULL,
    "orderId" integer,
    "orderModificationId" integer
);


ALTER TABLE public.surcharge OWNER TO ghienan;

--
-- Name: surcharge_id_seq; Type: SEQUENCE; Schema: public; Owner: ghienan
--

CREATE SEQUENCE public.surcharge_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.surcharge_id_seq OWNER TO ghienan;

--
-- Name: surcharge_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ghienan
--

ALTER SEQUENCE public.surcharge_id_seq OWNED BY public.surcharge.id;


--
-- Name: tag; Type: TABLE; Schema: public; Owner: ghienan
--

CREATE TABLE public.tag (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    value character varying NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.tag OWNER TO ghienan;

--
-- Name: tag_id_seq; Type: SEQUENCE; Schema: public; Owner: ghienan
--

CREATE SEQUENCE public.tag_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tag_id_seq OWNER TO ghienan;

--
-- Name: tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ghienan
--

ALTER SEQUENCE public.tag_id_seq OWNED BY public.tag.id;


--
-- Name: tax_category; Type: TABLE; Schema: public; Owner: ghienan
--

CREATE TABLE public.tax_category (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    name character varying NOT NULL,
    "isDefault" boolean DEFAULT false NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.tax_category OWNER TO ghienan;

--
-- Name: tax_category_id_seq; Type: SEQUENCE; Schema: public; Owner: ghienan
--

CREATE SEQUENCE public.tax_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tax_category_id_seq OWNER TO ghienan;

--
-- Name: tax_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ghienan
--

ALTER SEQUENCE public.tax_category_id_seq OWNED BY public.tax_category.id;


--
-- Name: tax_rate; Type: TABLE; Schema: public; Owner: ghienan
--

CREATE TABLE public.tax_rate (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    name character varying NOT NULL,
    enabled boolean NOT NULL,
    value numeric(5,2) NOT NULL,
    id integer NOT NULL,
    "categoryId" integer,
    "zoneId" integer,
    "customerGroupId" integer
);


ALTER TABLE public.tax_rate OWNER TO ghienan;

--
-- Name: tax_rate_id_seq; Type: SEQUENCE; Schema: public; Owner: ghienan
--

CREATE SEQUENCE public.tax_rate_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tax_rate_id_seq OWNER TO ghienan;

--
-- Name: tax_rate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ghienan
--

ALTER SEQUENCE public.tax_rate_id_seq OWNED BY public.tax_rate.id;


--
-- Name: user; Type: TABLE; Schema: public; Owner: ghienan
--

CREATE TABLE public."user" (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp without time zone,
    identifier character varying NOT NULL,
    verified boolean DEFAULT false NOT NULL,
    "lastLogin" timestamp without time zone,
    id integer NOT NULL
);


ALTER TABLE public."user" OWNER TO ghienan;

--
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: ghienan
--

CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_id_seq OWNER TO ghienan;

--
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ghienan
--

ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;


--
-- Name: user_roles_role; Type: TABLE; Schema: public; Owner: ghienan
--

CREATE TABLE public.user_roles_role (
    "userId" integer NOT NULL,
    "roleId" integer NOT NULL
);


ALTER TABLE public.user_roles_role OWNER TO ghienan;

--
-- Name: zone; Type: TABLE; Schema: public; Owner: ghienan
--

CREATE TABLE public.zone (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    name character varying NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.zone OWNER TO ghienan;

--
-- Name: zone_id_seq; Type: SEQUENCE; Schema: public; Owner: ghienan
--

CREATE SEQUENCE public.zone_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.zone_id_seq OWNER TO ghienan;

--
-- Name: zone_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ghienan
--

ALTER SEQUENCE public.zone_id_seq OWNED BY public.zone.id;


--
-- Name: zone_members_country; Type: TABLE; Schema: public; Owner: ghienan
--

CREATE TABLE public.zone_members_country (
    "zoneId" integer NOT NULL,
    "countryId" integer NOT NULL
);


ALTER TABLE public.zone_members_country OWNER TO ghienan;

--
-- Name: address id; Type: DEFAULT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.address ALTER COLUMN id SET DEFAULT nextval('public.address_id_seq'::regclass);


--
-- Name: administrator id; Type: DEFAULT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.administrator ALTER COLUMN id SET DEFAULT nextval('public.administrator_id_seq'::regclass);


--
-- Name: asset id; Type: DEFAULT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.asset ALTER COLUMN id SET DEFAULT nextval('public.asset_id_seq'::regclass);


--
-- Name: authentication_method id; Type: DEFAULT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.authentication_method ALTER COLUMN id SET DEFAULT nextval('public.authentication_method_id_seq'::regclass);


--
-- Name: channel id; Type: DEFAULT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.channel ALTER COLUMN id SET DEFAULT nextval('public.channel_id_seq'::regclass);


--
-- Name: collection id; Type: DEFAULT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.collection ALTER COLUMN id SET DEFAULT nextval('public.collection_id_seq'::regclass);


--
-- Name: collection_asset id; Type: DEFAULT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.collection_asset ALTER COLUMN id SET DEFAULT nextval('public.collection_asset_id_seq'::regclass);


--
-- Name: collection_translation id; Type: DEFAULT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.collection_translation ALTER COLUMN id SET DEFAULT nextval('public.collection_translation_id_seq'::regclass);


--
-- Name: country id; Type: DEFAULT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.country ALTER COLUMN id SET DEFAULT nextval('public.country_id_seq'::regclass);


--
-- Name: country_translation id; Type: DEFAULT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.country_translation ALTER COLUMN id SET DEFAULT nextval('public.country_translation_id_seq'::regclass);


--
-- Name: customer id; Type: DEFAULT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.customer ALTER COLUMN id SET DEFAULT nextval('public.customer_id_seq'::regclass);


--
-- Name: customer_group id; Type: DEFAULT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.customer_group ALTER COLUMN id SET DEFAULT nextval('public.customer_group_id_seq'::regclass);


--
-- Name: facet id; Type: DEFAULT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.facet ALTER COLUMN id SET DEFAULT nextval('public.facet_id_seq'::regclass);


--
-- Name: facet_translation id; Type: DEFAULT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.facet_translation ALTER COLUMN id SET DEFAULT nextval('public.facet_translation_id_seq'::regclass);


--
-- Name: facet_value id; Type: DEFAULT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.facet_value ALTER COLUMN id SET DEFAULT nextval('public.facet_value_id_seq'::regclass);


--
-- Name: facet_value_translation id; Type: DEFAULT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.facet_value_translation ALTER COLUMN id SET DEFAULT nextval('public.facet_value_translation_id_seq'::regclass);


--
-- Name: fulfillment id; Type: DEFAULT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.fulfillment ALTER COLUMN id SET DEFAULT nextval('public.fulfillment_id_seq'::regclass);


--
-- Name: global_settings id; Type: DEFAULT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.global_settings ALTER COLUMN id SET DEFAULT nextval('public.global_settings_id_seq'::regclass);


--
-- Name: history_entry id; Type: DEFAULT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.history_entry ALTER COLUMN id SET DEFAULT nextval('public.history_entry_id_seq'::regclass);


--
-- Name: job_record id; Type: DEFAULT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.job_record ALTER COLUMN id SET DEFAULT nextval('public.job_record_id_seq'::regclass);


--
-- Name: job_record_buffer id; Type: DEFAULT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.job_record_buffer ALTER COLUMN id SET DEFAULT nextval('public.job_record_buffer_id_seq'::regclass);


--
-- Name: order id; Type: DEFAULT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public."order" ALTER COLUMN id SET DEFAULT nextval('public.order_id_seq'::regclass);


--
-- Name: order_item id; Type: DEFAULT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.order_item ALTER COLUMN id SET DEFAULT nextval('public.order_item_id_seq'::regclass);


--
-- Name: order_line id; Type: DEFAULT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.order_line ALTER COLUMN id SET DEFAULT nextval('public.order_line_id_seq'::regclass);


--
-- Name: order_modification id; Type: DEFAULT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.order_modification ALTER COLUMN id SET DEFAULT nextval('public.order_modification_id_seq'::regclass);


--
-- Name: payment id; Type: DEFAULT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.payment ALTER COLUMN id SET DEFAULT nextval('public.payment_id_seq'::regclass);


--
-- Name: payment_method id; Type: DEFAULT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.payment_method ALTER COLUMN id SET DEFAULT nextval('public.payment_method_id_seq'::regclass);


--
-- Name: product id; Type: DEFAULT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.product ALTER COLUMN id SET DEFAULT nextval('public.product_id_seq'::regclass);


--
-- Name: product_asset id; Type: DEFAULT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.product_asset ALTER COLUMN id SET DEFAULT nextval('public.product_asset_id_seq'::regclass);


--
-- Name: product_option id; Type: DEFAULT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.product_option ALTER COLUMN id SET DEFAULT nextval('public.product_option_id_seq'::regclass);


--
-- Name: product_option_group id; Type: DEFAULT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.product_option_group ALTER COLUMN id SET DEFAULT nextval('public.product_option_group_id_seq'::regclass);


--
-- Name: product_option_group_translation id; Type: DEFAULT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.product_option_group_translation ALTER COLUMN id SET DEFAULT nextval('public.product_option_group_translation_id_seq'::regclass);


--
-- Name: product_option_translation id; Type: DEFAULT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.product_option_translation ALTER COLUMN id SET DEFAULT nextval('public.product_option_translation_id_seq'::regclass);


--
-- Name: product_translation id; Type: DEFAULT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.product_translation ALTER COLUMN id SET DEFAULT nextval('public.product_translation_id_seq'::regclass);


--
-- Name: product_variant id; Type: DEFAULT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.product_variant ALTER COLUMN id SET DEFAULT nextval('public.product_variant_id_seq'::regclass);


--
-- Name: product_variant_asset id; Type: DEFAULT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.product_variant_asset ALTER COLUMN id SET DEFAULT nextval('public.product_variant_asset_id_seq'::regclass);


--
-- Name: product_variant_price id; Type: DEFAULT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.product_variant_price ALTER COLUMN id SET DEFAULT nextval('public.product_variant_price_id_seq'::regclass);


--
-- Name: product_variant_translation id; Type: DEFAULT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.product_variant_translation ALTER COLUMN id SET DEFAULT nextval('public.product_variant_translation_id_seq'::regclass);


--
-- Name: promotion id; Type: DEFAULT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.promotion ALTER COLUMN id SET DEFAULT nextval('public.promotion_id_seq'::regclass);


--
-- Name: refund id; Type: DEFAULT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.refund ALTER COLUMN id SET DEFAULT nextval('public.refund_id_seq'::regclass);


--
-- Name: role id; Type: DEFAULT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.role ALTER COLUMN id SET DEFAULT nextval('public.role_id_seq'::regclass);


--
-- Name: session id; Type: DEFAULT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.session ALTER COLUMN id SET DEFAULT nextval('public.session_id_seq'::regclass);


--
-- Name: shipping_line id; Type: DEFAULT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.shipping_line ALTER COLUMN id SET DEFAULT nextval('public.shipping_line_id_seq'::regclass);


--
-- Name: shipping_method id; Type: DEFAULT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.shipping_method ALTER COLUMN id SET DEFAULT nextval('public.shipping_method_id_seq'::regclass);


--
-- Name: shipping_method_translation id; Type: DEFAULT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.shipping_method_translation ALTER COLUMN id SET DEFAULT nextval('public.shipping_method_translation_id_seq'::regclass);


--
-- Name: stock_movement id; Type: DEFAULT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.stock_movement ALTER COLUMN id SET DEFAULT nextval('public.stock_movement_id_seq'::regclass);


--
-- Name: surcharge id; Type: DEFAULT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.surcharge ALTER COLUMN id SET DEFAULT nextval('public.surcharge_id_seq'::regclass);


--
-- Name: tag id; Type: DEFAULT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.tag ALTER COLUMN id SET DEFAULT nextval('public.tag_id_seq'::regclass);


--
-- Name: tax_category id; Type: DEFAULT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.tax_category ALTER COLUMN id SET DEFAULT nextval('public.tax_category_id_seq'::regclass);


--
-- Name: tax_rate id; Type: DEFAULT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.tax_rate ALTER COLUMN id SET DEFAULT nextval('public.tax_rate_id_seq'::regclass);


--
-- Name: user id; Type: DEFAULT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- Name: zone id; Type: DEFAULT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.zone ALTER COLUMN id SET DEFAULT nextval('public.zone_id_seq'::regclass);


--
-- Data for Name: address; Type: TABLE DATA; Schema: public; Owner: ghienan
--

COPY public.address ("createdAt", "updatedAt", "fullName", company, "streetLine1", "streetLine2", city, province, "postalCode", "phoneNumber", "defaultShippingAddress", "defaultBillingAddress", id, "customerId", "countryId") FROM stdin;
\.


--
-- Data for Name: administrator; Type: TABLE DATA; Schema: public; Owner: ghienan
--

COPY public.administrator ("createdAt", "updatedAt", "deletedAt", "firstName", "lastName", "emailAddress", id, "userId") FROM stdin;
2021-10-15 15:12:29.438053	2021-10-15 15:12:29.438053	\N	Super	Admin	admin	1	1
\.


--
-- Data for Name: asset; Type: TABLE DATA; Schema: public; Owner: ghienan
--

COPY public.asset ("createdAt", "updatedAt", name, type, "mimeType", width, height, "fileSize", source, preview, "focalPoint", id) FROM stdin;
2021-10-15 15:12:31.029515	2021-10-15 15:12:31.029515	derick-david-409858-unsplash.jpg	IMAGE	image/jpeg	1600	1200	44525	source\\b6\\derick-david-409858-unsplash.jpg	preview\\71\\derick-david-409858-unsplash__preview.jpg	\N	1
2021-10-15 15:12:31.194782	2021-10-15 15:12:31.194782	kelly-sikkema-685291-unsplash.jpg	IMAGE	image/jpeg	1600	1067	47714	source\\5a\\kelly-sikkema-685291-unsplash.jpg	preview\\b8\\kelly-sikkema-685291-unsplash__preview.jpg	\N	2
2021-10-15 15:12:31.231943	2021-10-15 15:12:31.231943	oscar-ivan-esquivel-arteaga-687447-unsplash.jpg	IMAGE	image/jpeg	1600	1071	76870	source\\0b\\oscar-ivan-esquivel-arteaga-687447-unsplash.jpg	preview\\a1\\oscar-ivan-esquivel-arteaga-687447-unsplash__preview.jpg	\N	3
2021-10-15 15:12:31.256116	2021-10-15 15:12:31.256116	daniel-korpai-1302051-unsplash.jpg	IMAGE	image/jpeg	1280	1600	201064	source\\28\\daniel-korpai-1302051-unsplash.jpg	preview\\d2\\daniel-korpai-1302051-unsplash__preview.jpg	\N	4
2021-10-15 15:12:31.278507	2021-10-15 15:12:31.278507	alexandru-acea-686569-unsplash.jpg	IMAGE	image/jpeg	1067	1600	71196	source\\e8\\alexandru-acea-686569-unsplash.jpg	preview\\9c\\alexandru-acea-686569-unsplash__preview.jpg	\N	5
2021-10-15 15:12:31.316908	2021-10-15 15:12:31.316908	liam-briese-1128307-unsplash.jpg	IMAGE	image/jpeg	1600	1067	120523	source\\2e\\liam-briese-1128307-unsplash.jpg	preview\\58\\liam-briese-1128307-unsplash__preview.jpg	\N	6
2021-10-15 15:12:31.364463	2021-10-15 15:12:31.364463	florian-olivo-1166419-unsplash.jpg	IMAGE	image/jpeg	1067	1600	73904	source\\63\\florian-olivo-1166419-unsplash.jpg	preview\\5a\\florian-olivo-1166419-unsplash__preview.jpg	\N	7
2021-10-15 15:12:31.433757	2021-10-15 15:12:31.433757	vincent-botta-736919-unsplash.jpg	IMAGE	image/jpeg	1600	1200	87075	source\\59\\vincent-botta-736919-unsplash.jpg	preview\\96\\vincent-botta-736919-unsplash__preview.jpg	\N	8
2021-10-15 15:12:31.50074	2021-10-15 15:12:31.50074	juan-gomez-674574-unsplash.jpg	IMAGE	image/jpeg	1600	1060	60470	source\\b8\\juan-gomez-674574-unsplash.jpg	preview\\09\\juan-gomez-674574-unsplash__preview.jpg	\N	9
2021-10-15 15:12:31.516949	2021-10-15 15:12:31.516949	thomas-q-1229169-unsplash.jpg	IMAGE	image/jpeg	1600	1600	94113	source\\86\\thomas-q-1229169-unsplash.jpg	preview\\7b\\thomas-q-1229169-unsplash__preview.jpg	\N	10
2021-10-15 15:12:31.532063	2021-10-15 15:12:31.532063	adam-birkett-239153-unsplash.jpg	IMAGE	image/jpeg	1067	1600	17676	source\\3c\\adam-birkett-239153-unsplash.jpg	preview\\64\\adam-birkett-239153-unsplash__preview.jpg	\N	11
2021-10-15 15:12:31.549039	2021-10-15 15:12:31.549039	eniko-kis-663725-unsplash.jpg	IMAGE	image/jpeg	1600	1067	42943	source\\1d\\eniko-kis-663725-unsplash.jpg	preview\\b5\\eniko-kis-663725-unsplash__preview.jpg	\N	12
2021-10-15 15:12:31.576158	2021-10-15 15:12:31.576158	brandi-redd-104140-unsplash.jpg	IMAGE	image/jpeg	1600	1110	91458	source\\21\\brandi-redd-104140-unsplash.jpg	preview\\9b\\brandi-redd-104140-unsplash__preview.jpg	\N	13
2021-10-15 15:12:31.600314	2021-10-15 15:12:31.600314	jonathan-talbert-697262-unsplash.jpg	IMAGE	image/jpeg	1067	1600	103011	source\\69\\jonathan-talbert-697262-unsplash.jpg	preview\\3c\\jonathan-talbert-697262-unsplash__preview.jpg	\N	14
2021-10-15 15:12:31.619831	2021-10-15 15:12:31.619831	zoltan-tasi-423051-unsplash.jpg	IMAGE	image/jpeg	1067	1600	49099	source\\92\\zoltan-tasi-423051-unsplash.jpg	preview\\21\\zoltan-tasi-423051-unsplash__preview.jpg	\N	15
2021-10-15 15:12:31.641819	2021-10-15 15:12:31.641819	jakob-owens-274337-unsplash.jpg	IMAGE	image/jpeg	1600	1067	213089	source\\cf\\jakob-owens-274337-unsplash.jpg	preview\\5b\\jakob-owens-274337-unsplash__preview.jpg	\N	16
2021-10-15 15:12:31.664256	2021-10-15 15:12:31.664256	patrick-brinksma-663044-unsplash.jpg	IMAGE	image/jpeg	1600	1067	190811	source\\0f\\patrick-brinksma-663044-unsplash.jpg	preview\\bc\\patrick-brinksma-663044-unsplash__preview.jpg	\N	17
2021-10-15 15:12:31.685199	2021-10-15 15:12:31.685199	chuttersnap-324234-unsplash.jpg	IMAGE	image/jpeg	1600	1068	118442	source\\df\\chuttersnap-324234-unsplash.jpg	preview\\95\\chuttersnap-324234-unsplash__preview.jpg	\N	18
2021-10-15 15:12:31.702713	2021-10-15 15:12:31.702713	robert-shunev-528016-unsplash.jpg	IMAGE	image/jpeg	1600	1067	36204	source\\9e\\robert-shunev-528016-unsplash.jpg	preview\\9d\\robert-shunev-528016-unsplash__preview.jpg	\N	19
2021-10-15 15:12:31.719303	2021-10-15 15:12:31.719303	alexander-andrews-260988-unsplash.jpg	IMAGE	image/jpeg	1050	1600	65460	source\\f8\\alexander-andrews-260988-unsplash.jpg	preview\\ef\\alexander-andrews-260988-unsplash__preview.jpg	\N	20
2021-10-15 15:12:31.739817	2021-10-15 15:12:31.739817	mikkel-bech-748940-unsplash.jpg	IMAGE	image/jpeg	1600	1130	62785	source\\29\\mikkel-bech-748940-unsplash.jpg	preview\\2f\\mikkel-bech-748940-unsplash__preview.jpg	\N	21
2021-10-15 15:12:31.772564	2021-10-15 15:12:31.772564	stoica-ionela-530966-unsplash.jpg	IMAGE	image/jpeg	1600	1600	50995	source\\b1\\stoica-ionela-530966-unsplash.jpg	preview\\34\\stoica-ionela-530966-unsplash__preview.jpg	\N	22
2021-10-15 15:12:31.793989	2021-10-15 15:12:31.793989	neonbrand-428982-unsplash.jpg	IMAGE	image/jpeg	1600	1332	169677	source\\3c\\neonbrand-428982-unsplash.jpg	preview\\4f\\neonbrand-428982-unsplash__preview.jpg	\N	23
2021-10-15 15:12:31.811928	2021-10-15 15:12:31.811928	michael-guite-571169-unsplash.jpg	IMAGE	image/jpeg	1600	1067	240247	source\\ab\\michael-guite-571169-unsplash.jpg	preview\\96\\michael-guite-571169-unsplash__preview.jpg	\N	24
2021-10-15 15:12:31.830313	2021-10-15 15:12:31.830313	max-tarkhov-737999-unsplash.jpg	IMAGE	image/jpeg	1600	1280	192508	source\\ed\\max-tarkhov-737999-unsplash.jpg	preview\\35\\max-tarkhov-737999-unsplash__preview.jpg	\N	25
2021-10-15 15:12:31.861551	2021-10-15 15:12:31.861551	nik-shuliahin-619349-unsplash.jpg	IMAGE	image/jpeg	1600	1020	130437	source\\87\\nik-shuliahin-619349-unsplash.jpg	preview\\d6\\nik-shuliahin-619349-unsplash__preview.jpg	\N	26
2021-10-15 15:12:31.887631	2021-10-15 15:12:31.887631	ben-hershey-574483-unsplash.jpg	IMAGE	image/jpeg	1600	1070	77118	source\\f3\\ben-hershey-574483-unsplash.jpg	preview\\30\\ben-hershey-574483-unsplash__preview.jpg	\N	27
2021-10-15 15:12:31.911158	2021-10-15 15:12:31.911158	tommy-bebo-600358-unsplash.jpg	IMAGE	image/jpeg	1067	1600	262335	source\\ac\\tommy-bebo-600358-unsplash.jpg	preview\\0f\\tommy-bebo-600358-unsplash__preview.jpg	\N	28
2021-10-15 15:12:31.925729	2021-10-15 15:12:31.925729	chuttersnap-584518-unsplash.jpg	IMAGE	image/jpeg	1600	1068	76330	source\\20\\chuttersnap-584518-unsplash.jpg	preview\\ed\\chuttersnap-584518-unsplash__preview.jpg	\N	29
2021-10-15 15:12:32.016836	2021-10-15 15:12:32.016836	imani-clovis-234736-unsplash.jpg	IMAGE	image/jpeg	1600	1600	99111	source\\de\\imani-clovis-234736-unsplash.jpg	preview\\0f\\imani-clovis-234736-unsplash__preview.jpg	\N	30
2021-10-15 15:12:32.073463	2021-10-15 15:12:32.073463	xavier-teo-469050-unsplash.jpg	IMAGE	image/jpeg	1200	1600	167599	source\\5c\\xavier-teo-469050-unsplash.jpg	preview\\3c\\xavier-teo-469050-unsplash__preview.jpg	\N	31
2021-10-15 15:12:32.13335	2021-10-15 15:12:32.13335	thomas-serer-420833-unsplash.jpg	IMAGE	image/jpeg	1600	1223	78999	source\\55\\thomas-serer-420833-unsplash.jpg	preview\\a2\\thomas-serer-420833-unsplash__preview.jpg	\N	32
2021-10-15 15:12:32.183222	2021-10-15 15:12:32.183222	nikolai-chernichenko-1299748-unsplash.jpg	IMAGE	image/jpeg	1600	1067	56282	source\\01\\nikolai-chernichenko-1299748-unsplash.jpg	preview\\00\\nikolai-chernichenko-1299748-unsplash__preview.jpg	\N	33
2021-10-15 15:12:32.231067	2021-10-15 15:12:32.231067	mitch-lensink-256007-unsplash.jpg	IMAGE	image/jpeg	1600	1067	154988	source\\2b\\mitch-lensink-256007-unsplash.jpg	preview\\aa\\mitch-lensink-256007-unsplash__preview.jpg	\N	34
2021-10-15 15:12:32.323712	2021-10-15 15:12:32.323712	charles-deluvio-695736-unsplash.jpg	IMAGE	image/jpeg	1600	1600	54419	source\\92\\charles-deluvio-695736-unsplash.jpg	preview\\78\\charles-deluvio-695736-unsplash__preview.jpg	\N	35
2021-10-15 15:12:32.371735	2021-10-15 15:12:32.371735	natalia-y-345738-unsplash.jpg	IMAGE	image/jpeg	900	1600	97819	source\\17\\natalia-y-345738-unsplash.jpg	preview\\14\\natalia-y-345738-unsplash__preview.jpg	\N	36
2021-10-15 15:12:32.392776	2021-10-15 15:12:32.392776	alex-rodriguez-santibanez-200278-unsplash.jpg	IMAGE	image/jpeg	1600	1067	176280	source\\ff\\alex-rodriguez-santibanez-200278-unsplash.jpg	preview\\5b\\alex-rodriguez-santibanez-200278-unsplash__preview.jpg	\N	37
2021-10-15 15:12:32.410388	2021-10-15 15:12:32.410388	silvia-agrasar-227575-unsplash.jpg	IMAGE	image/jpeg	1600	1063	119654	source\\d5\\silvia-agrasar-227575-unsplash.jpg	preview\\29\\silvia-agrasar-227575-unsplash__preview.jpg	\N	38
2021-10-15 15:12:32.426592	2021-10-15 15:12:32.426592	caleb-george-536388-unsplash.jpg	IMAGE	image/jpeg	1200	1600	184968	source\\f0\\caleb-george-536388-unsplash.jpg	preview\\6d\\caleb-george-536388-unsplash__preview.jpg	\N	39
2021-10-15 15:12:32.443576	2021-10-15 15:12:32.443576	annie-spratt-78044-unsplash.jpg	IMAGE	image/jpeg	1115	1600	173536	source\\f1\\annie-spratt-78044-unsplash.jpg	preview\\81\\annie-spratt-78044-unsplash__preview.jpg	\N	40
2021-10-15 15:12:32.459161	2021-10-15 15:12:32.459161	zoltan-kovacs-642412-unsplash.jpg	IMAGE	image/jpeg	1067	1600	72752	source\\e3\\zoltan-kovacs-642412-unsplash.jpg	preview\\88\\zoltan-kovacs-642412-unsplash__preview.jpg	\N	41
2021-10-15 15:12:32.474092	2021-10-15 15:12:32.474092	mark-tegethoff-667351-unsplash.jpg	IMAGE	image/jpeg	1600	1200	79857	source\\e6\\mark-tegethoff-667351-unsplash.jpg	preview\\f3\\mark-tegethoff-667351-unsplash__preview.jpg	\N	42
2021-10-15 15:12:32.489889	2021-10-15 15:12:32.489889	vincent-liu-525429-unsplash.jpg	IMAGE	image/jpeg	1600	1067	77358	source\\10\\vincent-liu-525429-unsplash.jpg	preview\\44\\vincent-liu-525429-unsplash__preview.jpg	\N	43
2021-10-15 15:12:32.537836	2021-10-15 15:12:32.537836	neslihan-gunaydin-3493-unsplash.jpg	IMAGE	image/jpeg	1600	1067	152486	source\\01\\neslihan-gunaydin-3493-unsplash.jpg	preview\\7d\\neslihan-gunaydin-3493-unsplash__preview.jpg	\N	44
2021-10-15 15:12:32.574626	2021-10-15 15:12:32.574626	florian-klauer-14840-unsplash.jpg	IMAGE	image/jpeg	800	1200	17149	source\\a9\\florian-klauer-14840-unsplash.jpg	preview\\ef\\florian-klauer-14840-unsplash__preview.jpg	\N	45
2021-10-15 15:12:32.604408	2021-10-15 15:12:32.604408	nathan-fertig-249917-unsplash.jpg	IMAGE	image/jpeg	1600	1067	113855	source\\68\\nathan-fertig-249917-unsplash.jpg	preview\\69\\nathan-fertig-249917-unsplash__preview.jpg	\N	46
2021-10-15 15:12:32.622037	2021-10-15 15:12:32.622037	paul-weaver-1120584-unsplash.jpg	IMAGE	image/jpeg	1600	1067	65612	source\\14\\paul-weaver-1120584-unsplash.jpg	preview\\3e\\paul-weaver-1120584-unsplash__preview.jpg	\N	47
2021-10-15 15:12:32.643667	2021-10-15 15:12:32.643667	pierre-chatel-innocenti-483198-unsplash.jpg	IMAGE	image/jpeg	1600	1067	32036	source\\39\\pierre-chatel-innocenti-483198-unsplash.jpg	preview\\5f\\pierre-chatel-innocenti-483198-unsplash__preview.jpg	\N	48
2021-10-15 15:12:32.661738	2021-10-15 15:12:32.661738	abel-y-costa-716024-unsplash.jpg	IMAGE	image/jpeg	1600	1067	103392	source\\46\\abel-y-costa-716024-unsplash.jpg	preview\\40\\abel-y-costa-716024-unsplash__preview.jpg	\N	49
2021-10-15 15:12:32.686519	2021-10-15 15:12:32.686519	kari-shea-398668-unsplash.jpg	IMAGE	image/jpeg	1048	1500	181352	source\\4f\\kari-shea-398668-unsplash.jpg	preview\\3b\\kari-shea-398668-unsplash__preview.jpg	\N	50
2021-10-15 15:12:32.705844	2021-10-15 15:12:32.705844	andres-jasso-220776-unsplash.jpg	IMAGE	image/jpeg	1600	1104	100927	source\\f1\\andres-jasso-220776-unsplash.jpg	preview\\09\\andres-jasso-220776-unsplash__preview.jpg	\N	51
2021-10-15 15:12:32.723999	2021-10-15 15:12:32.723999	ruslan-bardash-351288-unsplash.jpg	IMAGE	image/jpeg	1067	1600	47113	source\\95\\ruslan-bardash-351288-unsplash.jpg	preview\\d0\\ruslan-bardash-351288-unsplash__preview.jpg	\N	52
2021-10-15 15:12:32.742533	2021-10-15 15:12:32.742533	benjamin-voros-310026-unsplash.jpg	IMAGE	image/jpeg	1200	1600	218391	source\\7a\\benjamin-voros-310026-unsplash.jpg	preview\\72\\benjamin-voros-310026-unsplash__preview.jpg	\N	53
2021-10-15 15:12:32.758892	2021-10-15 15:12:32.758892	jean-philippe-delberghe-1400011-unsplash.jpg	IMAGE	image/jpeg	1067	1600	64529	source\\94\\jean-philippe-delberghe-1400011-unsplash.jpg	preview\\b1\\jean-philippe-delberghe-1400011-unsplash__preview.jpg	\N	54
2021-11-08 13:37:34.78534	2021-11-08 13:37:34.78534	derick-david-409858-unsplash.jpg	IMAGE	image/jpeg	1600	1200	44525	source\\b6\\derick-david-409858-unsplash.jpg	preview\\71\\derick-david-409858-unsplash__preview.jpg	\N	55
2021-11-08 13:37:34.973457	2021-11-08 13:37:34.973457	kelly-sikkema-685291-unsplash.jpg	IMAGE	image/jpeg	1600	1067	47714	source\\5a\\kelly-sikkema-685291-unsplash.jpg	preview\\b8\\kelly-sikkema-685291-unsplash__preview.jpg	\N	56
2021-11-08 13:37:35.015775	2021-11-08 13:37:35.015775	oscar-ivan-esquivel-arteaga-687447-unsplash.jpg	IMAGE	image/jpeg	1600	1071	76870	source\\0b\\oscar-ivan-esquivel-arteaga-687447-unsplash.jpg	preview\\a1\\oscar-ivan-esquivel-arteaga-687447-unsplash__preview.jpg	\N	57
2021-11-08 13:37:35.038672	2021-11-08 13:37:35.038672	daniel-korpai-1302051-unsplash.jpg	IMAGE	image/jpeg	1280	1600	201064	source\\28\\daniel-korpai-1302051-unsplash.jpg	preview\\d2\\daniel-korpai-1302051-unsplash__preview.jpg	\N	58
2021-11-08 13:37:35.058398	2021-11-08 13:37:35.058398	alexandru-acea-686569-unsplash.jpg	IMAGE	image/jpeg	1067	1600	71196	source\\e8\\alexandru-acea-686569-unsplash.jpg	preview\\9c\\alexandru-acea-686569-unsplash__preview.jpg	\N	59
2021-11-08 13:37:35.107071	2021-11-08 13:37:35.107071	liam-briese-1128307-unsplash.jpg	IMAGE	image/jpeg	1600	1067	120523	source\\2e\\liam-briese-1128307-unsplash.jpg	preview\\58\\liam-briese-1128307-unsplash__preview.jpg	\N	60
2021-11-08 13:37:35.156485	2021-11-08 13:37:35.156485	florian-olivo-1166419-unsplash.jpg	IMAGE	image/jpeg	1067	1600	73904	source\\63\\florian-olivo-1166419-unsplash.jpg	preview\\5a\\florian-olivo-1166419-unsplash__preview.jpg	\N	61
2021-11-08 13:37:35.232195	2021-11-08 13:37:35.232195	vincent-botta-736919-unsplash.jpg	IMAGE	image/jpeg	1600	1200	87075	source\\59\\vincent-botta-736919-unsplash.jpg	preview\\96\\vincent-botta-736919-unsplash__preview.jpg	\N	62
2021-11-08 13:37:35.305755	2021-11-08 13:37:35.305755	juan-gomez-674574-unsplash.jpg	IMAGE	image/jpeg	1600	1060	60470	source\\b8\\juan-gomez-674574-unsplash.jpg	preview\\09\\juan-gomez-674574-unsplash__preview.jpg	\N	63
2021-11-08 13:37:35.325873	2021-11-08 13:37:35.325873	thomas-q-1229169-unsplash.jpg	IMAGE	image/jpeg	1600	1600	94113	source\\86\\thomas-q-1229169-unsplash.jpg	preview\\7b\\thomas-q-1229169-unsplash__preview.jpg	\N	64
2021-11-08 13:37:35.344795	2021-11-08 13:37:35.344795	adam-birkett-239153-unsplash.jpg	IMAGE	image/jpeg	1067	1600	17676	source\\3c\\adam-birkett-239153-unsplash.jpg	preview\\64\\adam-birkett-239153-unsplash__preview.jpg	\N	65
2021-11-08 13:37:35.364063	2021-11-08 13:37:35.364063	eniko-kis-663725-unsplash.jpg	IMAGE	image/jpeg	1600	1067	42943	source\\1d\\eniko-kis-663725-unsplash.jpg	preview\\b5\\eniko-kis-663725-unsplash__preview.jpg	\N	66
2021-11-08 13:37:35.383039	2021-11-08 13:37:35.383039	brandi-redd-104140-unsplash.jpg	IMAGE	image/jpeg	1600	1110	91458	source\\21\\brandi-redd-104140-unsplash.jpg	preview\\9b\\brandi-redd-104140-unsplash__preview.jpg	\N	67
2021-11-08 13:37:35.404475	2021-11-08 13:37:35.404475	jonathan-talbert-697262-unsplash.jpg	IMAGE	image/jpeg	1067	1600	103011	source\\69\\jonathan-talbert-697262-unsplash.jpg	preview\\3c\\jonathan-talbert-697262-unsplash__preview.jpg	\N	68
2021-11-08 13:37:35.421091	2021-11-08 13:37:35.421091	zoltan-tasi-423051-unsplash.jpg	IMAGE	image/jpeg	1067	1600	49099	source\\92\\zoltan-tasi-423051-unsplash.jpg	preview\\21\\zoltan-tasi-423051-unsplash__preview.jpg	\N	69
2021-11-08 13:37:35.440068	2021-11-08 13:37:35.440068	jakob-owens-274337-unsplash.jpg	IMAGE	image/jpeg	1600	1067	213089	source\\cf\\jakob-owens-274337-unsplash.jpg	preview\\5b\\jakob-owens-274337-unsplash__preview.jpg	\N	70
2021-11-08 13:37:35.460085	2021-11-08 13:37:35.460085	patrick-brinksma-663044-unsplash.jpg	IMAGE	image/jpeg	1600	1067	190811	source\\0f\\patrick-brinksma-663044-unsplash.jpg	preview\\bc\\patrick-brinksma-663044-unsplash__preview.jpg	\N	71
2021-11-08 13:37:35.484061	2021-11-08 13:37:35.484061	chuttersnap-324234-unsplash.jpg	IMAGE	image/jpeg	1600	1068	118442	source\\df\\chuttersnap-324234-unsplash.jpg	preview\\95\\chuttersnap-324234-unsplash__preview.jpg	\N	72
2021-11-08 13:37:35.500751	2021-11-08 13:37:35.500751	robert-shunev-528016-unsplash.jpg	IMAGE	image/jpeg	1600	1067	36204	source\\9e\\robert-shunev-528016-unsplash.jpg	preview\\9d\\robert-shunev-528016-unsplash__preview.jpg	\N	73
2021-11-08 13:37:35.518425	2021-11-08 13:37:35.518425	alexander-andrews-260988-unsplash.jpg	IMAGE	image/jpeg	1050	1600	65460	source\\f8\\alexander-andrews-260988-unsplash.jpg	preview\\ef\\alexander-andrews-260988-unsplash__preview.jpg	\N	74
2021-11-08 13:37:35.535653	2021-11-08 13:37:35.535653	mikkel-bech-748940-unsplash.jpg	IMAGE	image/jpeg	1600	1130	62785	source\\29\\mikkel-bech-748940-unsplash.jpg	preview\\2f\\mikkel-bech-748940-unsplash__preview.jpg	\N	75
2021-11-08 13:37:35.555823	2021-11-08 13:37:35.555823	stoica-ionela-530966-unsplash.jpg	IMAGE	image/jpeg	1600	1600	50995	source\\b1\\stoica-ionela-530966-unsplash.jpg	preview\\34\\stoica-ionela-530966-unsplash__preview.jpg	\N	76
2021-11-08 13:37:35.571888	2021-11-08 13:37:35.571888	neonbrand-428982-unsplash.jpg	IMAGE	image/jpeg	1600	1332	169677	source\\3c\\neonbrand-428982-unsplash.jpg	preview\\4f\\neonbrand-428982-unsplash__preview.jpg	\N	77
2021-11-08 13:37:35.588317	2021-11-08 13:37:35.588317	michael-guite-571169-unsplash.jpg	IMAGE	image/jpeg	1600	1067	240247	source\\ab\\michael-guite-571169-unsplash.jpg	preview\\96\\michael-guite-571169-unsplash__preview.jpg	\N	78
2021-11-08 13:37:35.608822	2021-11-08 13:37:35.608822	max-tarkhov-737999-unsplash.jpg	IMAGE	image/jpeg	1600	1280	192508	source\\ed\\max-tarkhov-737999-unsplash.jpg	preview\\35\\max-tarkhov-737999-unsplash__preview.jpg	\N	79
2021-11-08 13:37:35.625506	2021-11-08 13:37:35.625506	nik-shuliahin-619349-unsplash.jpg	IMAGE	image/jpeg	1600	1020	130437	source\\87\\nik-shuliahin-619349-unsplash.jpg	preview\\d6\\nik-shuliahin-619349-unsplash__preview.jpg	\N	80
2021-11-08 13:37:35.639592	2021-11-08 13:37:35.639592	ben-hershey-574483-unsplash.jpg	IMAGE	image/jpeg	1600	1070	77118	source\\f3\\ben-hershey-574483-unsplash.jpg	preview\\30\\ben-hershey-574483-unsplash__preview.jpg	\N	81
2021-11-08 13:37:35.654775	2021-11-08 13:37:35.654775	tommy-bebo-600358-unsplash.jpg	IMAGE	image/jpeg	1067	1600	262335	source\\ac\\tommy-bebo-600358-unsplash.jpg	preview\\0f\\tommy-bebo-600358-unsplash__preview.jpg	\N	82
2021-11-08 13:37:35.669279	2021-11-08 13:37:35.669279	chuttersnap-584518-unsplash.jpg	IMAGE	image/jpeg	1600	1068	76330	source\\20\\chuttersnap-584518-unsplash.jpg	preview\\ed\\chuttersnap-584518-unsplash__preview.jpg	\N	83
2021-11-08 13:37:35.729295	2021-11-08 13:37:35.729295	imani-clovis-234736-unsplash.jpg	IMAGE	image/jpeg	1600	1600	99111	source\\de\\imani-clovis-234736-unsplash.jpg	preview\\0f\\imani-clovis-234736-unsplash__preview.jpg	\N	84
2021-11-08 13:37:35.798095	2021-11-08 13:37:35.798095	xavier-teo-469050-unsplash.jpg	IMAGE	image/jpeg	1200	1600	167599	source\\5c\\xavier-teo-469050-unsplash.jpg	preview\\3c\\xavier-teo-469050-unsplash__preview.jpg	\N	85
2021-11-08 13:37:35.873921	2021-11-08 13:37:35.873921	thomas-serer-420833-unsplash.jpg	IMAGE	image/jpeg	1600	1223	78999	source\\55\\thomas-serer-420833-unsplash.jpg	preview\\a2\\thomas-serer-420833-unsplash__preview.jpg	\N	86
2021-11-08 13:37:35.931212	2021-11-08 13:37:35.931212	nikolai-chernichenko-1299748-unsplash.jpg	IMAGE	image/jpeg	1600	1067	56282	source\\01\\nikolai-chernichenko-1299748-unsplash.jpg	preview\\00\\nikolai-chernichenko-1299748-unsplash__preview.jpg	\N	87
2021-11-08 13:37:35.985054	2021-11-08 13:37:35.985054	mitch-lensink-256007-unsplash.jpg	IMAGE	image/jpeg	1600	1067	154988	source\\2b\\mitch-lensink-256007-unsplash.jpg	preview\\aa\\mitch-lensink-256007-unsplash__preview.jpg	\N	88
2021-11-08 13:37:36.037451	2021-11-08 13:37:36.037451	charles-deluvio-695736-unsplash.jpg	IMAGE	image/jpeg	1600	1600	54419	source\\92\\charles-deluvio-695736-unsplash.jpg	preview\\78\\charles-deluvio-695736-unsplash__preview.jpg	\N	89
2021-11-08 13:37:36.092471	2021-11-08 13:37:36.092471	natalia-y-345738-unsplash.jpg	IMAGE	image/jpeg	900	1600	97819	source\\17\\natalia-y-345738-unsplash.jpg	preview\\14\\natalia-y-345738-unsplash__preview.jpg	\N	90
2021-11-08 13:37:36.115845	2021-11-08 13:37:36.115845	alex-rodriguez-santibanez-200278-unsplash.jpg	IMAGE	image/jpeg	1600	1067	176280	source\\ff\\alex-rodriguez-santibanez-200278-unsplash.jpg	preview\\5b\\alex-rodriguez-santibanez-200278-unsplash__preview.jpg	\N	91
2021-11-08 13:37:36.133715	2021-11-08 13:37:36.133715	silvia-agrasar-227575-unsplash.jpg	IMAGE	image/jpeg	1600	1063	119654	source\\d5\\silvia-agrasar-227575-unsplash.jpg	preview\\29\\silvia-agrasar-227575-unsplash__preview.jpg	\N	92
2021-11-08 13:37:36.151967	2021-11-08 13:37:36.151967	caleb-george-536388-unsplash.jpg	IMAGE	image/jpeg	1200	1600	184968	source\\f0\\caleb-george-536388-unsplash.jpg	preview\\6d\\caleb-george-536388-unsplash__preview.jpg	\N	93
2021-11-08 13:37:36.168894	2021-11-08 13:37:36.168894	annie-spratt-78044-unsplash.jpg	IMAGE	image/jpeg	1115	1600	173536	source\\f1\\annie-spratt-78044-unsplash.jpg	preview\\81\\annie-spratt-78044-unsplash__preview.jpg	\N	94
2021-11-08 13:37:36.188657	2021-11-08 13:37:36.188657	zoltan-kovacs-642412-unsplash.jpg	IMAGE	image/jpeg	1067	1600	72752	source\\e3\\zoltan-kovacs-642412-unsplash.jpg	preview\\88\\zoltan-kovacs-642412-unsplash__preview.jpg	\N	95
2021-11-08 13:37:36.208611	2021-11-08 13:37:36.208611	mark-tegethoff-667351-unsplash.jpg	IMAGE	image/jpeg	1600	1200	79857	source\\e6\\mark-tegethoff-667351-unsplash.jpg	preview\\f3\\mark-tegethoff-667351-unsplash__preview.jpg	\N	96
2021-11-08 13:37:36.22516	2021-11-08 13:37:36.22516	vincent-liu-525429-unsplash.jpg	IMAGE	image/jpeg	1600	1067	77358	source\\10\\vincent-liu-525429-unsplash.jpg	preview\\44\\vincent-liu-525429-unsplash__preview.jpg	\N	97
2021-11-08 13:37:36.250581	2021-11-08 13:37:36.250581	neslihan-gunaydin-3493-unsplash.jpg	IMAGE	image/jpeg	1600	1067	152486	source\\01\\neslihan-gunaydin-3493-unsplash.jpg	preview\\7d\\neslihan-gunaydin-3493-unsplash__preview.jpg	\N	98
2021-11-08 13:37:36.269729	2021-11-08 13:37:36.269729	florian-klauer-14840-unsplash.jpg	IMAGE	image/jpeg	800	1200	17149	source\\a9\\florian-klauer-14840-unsplash.jpg	preview\\ef\\florian-klauer-14840-unsplash__preview.jpg	\N	99
2021-11-08 13:37:36.289415	2021-11-08 13:37:36.289415	nathan-fertig-249917-unsplash.jpg	IMAGE	image/jpeg	1600	1067	113855	source\\68\\nathan-fertig-249917-unsplash.jpg	preview\\69\\nathan-fertig-249917-unsplash__preview.jpg	\N	100
2021-11-08 13:37:36.305633	2021-11-08 13:37:36.305633	paul-weaver-1120584-unsplash.jpg	IMAGE	image/jpeg	1600	1067	65612	source\\14\\paul-weaver-1120584-unsplash.jpg	preview\\3e\\paul-weaver-1120584-unsplash__preview.jpg	\N	101
2021-11-08 13:37:36.322869	2021-11-08 13:37:36.322869	pierre-chatel-innocenti-483198-unsplash.jpg	IMAGE	image/jpeg	1600	1067	32036	source\\39\\pierre-chatel-innocenti-483198-unsplash.jpg	preview\\5f\\pierre-chatel-innocenti-483198-unsplash__preview.jpg	\N	102
2021-11-08 13:37:36.338254	2021-11-08 13:37:36.338254	abel-y-costa-716024-unsplash.jpg	IMAGE	image/jpeg	1600	1067	103392	source\\46\\abel-y-costa-716024-unsplash.jpg	preview\\40\\abel-y-costa-716024-unsplash__preview.jpg	\N	103
2021-11-08 13:37:36.355323	2021-11-08 13:37:36.355323	kari-shea-398668-unsplash.jpg	IMAGE	image/jpeg	1048	1500	181352	source\\4f\\kari-shea-398668-unsplash.jpg	preview\\3b\\kari-shea-398668-unsplash__preview.jpg	\N	104
2021-11-08 13:37:36.371289	2021-11-08 13:37:36.371289	andres-jasso-220776-unsplash.jpg	IMAGE	image/jpeg	1600	1104	100927	source\\f1\\andres-jasso-220776-unsplash.jpg	preview\\09\\andres-jasso-220776-unsplash__preview.jpg	\N	105
2021-11-08 13:37:36.387327	2021-11-08 13:37:36.387327	ruslan-bardash-351288-unsplash.jpg	IMAGE	image/jpeg	1067	1600	47113	source\\95\\ruslan-bardash-351288-unsplash.jpg	preview\\d0\\ruslan-bardash-351288-unsplash__preview.jpg	\N	106
2021-11-08 13:37:36.402708	2021-11-08 13:37:36.402708	benjamin-voros-310026-unsplash.jpg	IMAGE	image/jpeg	1200	1600	218391	source\\7a\\benjamin-voros-310026-unsplash.jpg	preview\\72\\benjamin-voros-310026-unsplash__preview.jpg	\N	107
2021-11-08 13:37:36.41837	2021-11-08 13:37:36.41837	jean-philippe-delberghe-1400011-unsplash.jpg	IMAGE	image/jpeg	1067	1600	64529	source\\94\\jean-philippe-delberghe-1400011-unsplash.jpg	preview\\b1\\jean-philippe-delberghe-1400011-unsplash__preview.jpg	\N	108
\.


--
-- Data for Name: asset_channels_channel; Type: TABLE DATA; Schema: public; Owner: ghienan
--

COPY public.asset_channels_channel ("assetId", "channelId") FROM stdin;
1	1
2	1
3	1
4	1
5	1
6	1
7	1
8	1
9	1
10	1
11	1
12	1
13	1
14	1
15	1
16	1
17	1
18	1
19	1
20	1
21	1
22	1
23	1
24	1
25	1
26	1
27	1
28	1
29	1
30	1
31	1
32	1
33	1
34	1
35	1
36	1
37	1
38	1
39	1
40	1
41	1
42	1
43	1
44	1
45	1
46	1
47	1
48	1
49	1
50	1
51	1
52	1
53	1
54	1
55	1
56	1
57	1
58	1
59	1
60	1
61	1
62	1
63	1
64	1
65	1
66	1
67	1
68	1
69	1
70	1
71	1
72	1
73	1
74	1
75	1
76	1
77	1
78	1
79	1
80	1
81	1
82	1
83	1
84	1
85	1
86	1
87	1
88	1
89	1
90	1
91	1
92	1
93	1
94	1
95	1
96	1
97	1
98	1
99	1
100	1
101	1
102	1
103	1
104	1
105	1
106	1
107	1
108	1
\.


--
-- Data for Name: asset_tags_tag; Type: TABLE DATA; Schema: public; Owner: ghienan
--

COPY public.asset_tags_tag ("assetId", "tagId") FROM stdin;
\.


--
-- Data for Name: authentication_method; Type: TABLE DATA; Schema: public; Owner: ghienan
--

COPY public.authentication_method ("createdAt", "updatedAt", identifier, "passwordHash", "verificationToken", "passwordResetToken", "identifierChangeToken", "pendingIdentifier", strategy, "externalIdentifier", metadata, id, type, "userId") FROM stdin;
2021-10-15 15:12:29.427356	2021-10-15 15:12:29.432087	admin	$2b$12$Di6XYS0NeDnkIiioXXQtLensihUPXAoc7fQ4vdiZz/n8HVqAJABR6	\N	\N	\N	\N	\N	\N	\N	1	NativeAuthenticationMethod	1
\.


--
-- Data for Name: channel; Type: TABLE DATA; Schema: public; Owner: ghienan
--

COPY public.channel ("createdAt", "updatedAt", code, token, "defaultLanguageCode", "currencyCode", "pricesIncludeTax", id, "defaultTaxZoneId", "defaultShippingZoneId") FROM stdin;
2021-10-15 15:12:29.135521	2021-11-08 13:37:34.690453	__default_channel__	qmp15bmbp0p5zc38dy8	en	USD	f	1	7	7
\.


--
-- Data for Name: collection; Type: TABLE DATA; Schema: public; Owner: ghienan
--

COPY public.collection ("createdAt", "updatedAt", "isRoot", "position", "isPrivate", filters, id, "featuredAssetId", "parentId") FROM stdin;
2021-10-15 15:12:32.828534	2021-10-15 15:12:32.828534	t	0	f	[]	1	\N	\N
2021-10-15 15:12:32.843912	2021-10-15 15:12:32.843912	f	1	f	[{"code":"facet-value-filter","args":[{"name":"facetValueIds","value":"[1]"},{"name":"containsAny","value":"false"}]}]	2	16	1
2021-10-15 15:12:32.877191	2021-10-15 15:12:32.877191	f	1	f	[{"code":"facet-value-filter","args":[{"name":"facetValueIds","value":"[2]"},{"name":"containsAny","value":"false"}]}]	3	5	2
2021-10-15 15:12:32.899178	2021-10-15 15:12:32.899178	f	2	f	[{"code":"facet-value-filter","args":[{"name":"facetValueIds","value":"[9]"},{"name":"containsAny","value":"false"}]}]	4	12	2
2021-10-15 15:12:32.92313	2021-10-15 15:12:32.92313	f	2	f	[{"code":"facet-value-filter","args":[{"name":"facetValueIds","value":"[30]"},{"name":"containsAny","value":"false"}]}]	5	47	1
2021-10-15 15:12:32.95063	2021-10-15 15:12:32.95063	f	1	f	[{"code":"facet-value-filter","args":[{"name":"facetValueIds","value":"[34]"},{"name":"containsAny","value":"false"}]}]	6	46	5
2021-10-15 15:12:32.96885	2021-10-15 15:12:32.96885	f	2	f	[{"code":"facet-value-filter","args":[{"name":"facetValueIds","value":"[31]"},{"name":"containsAny","value":"false"}]}]	7	37	5
2021-10-15 15:12:32.985095	2021-10-15 15:12:32.985095	f	3	f	[{"code":"facet-value-filter","args":[{"name":"facetValueIds","value":"[17]"},{"name":"containsAny","value":"false"}]}]	8	24	1
2021-10-15 15:12:33.004795	2021-10-15 15:12:33.004795	f	1	f	[{"code":"facet-value-filter","args":[{"name":"facetValueIds","value":"[18]"},{"name":"containsAny","value":"false"}]}]	9	23	8
2021-10-15 15:12:33.024205	2021-10-15 15:12:33.024205	f	2	f	[{"code":"facet-value-filter","args":[{"name":"facetValueIds","value":"[23]"},{"name":"containsAny","value":"false"}]}]	10	32	8
2021-11-08 13:37:36.492969	2021-11-08 13:37:36.492969	f	4	f	[{"code":"facet-value-filter","args":[{"name":"facetValueIds","value":"[1]"},{"name":"containsAny","value":"false"}]}]	11	70	1
2021-11-08 13:37:36.532269	2021-11-08 13:37:36.532269	f	1	f	[{"code":"facet-value-filter","args":[{"name":"facetValueIds","value":"[2]"},{"name":"containsAny","value":"false"}]}]	12	59	11
2021-11-08 13:37:36.554642	2021-11-08 13:37:36.554642	f	2	f	[{"code":"facet-value-filter","args":[{"name":"facetValueIds","value":"[9]"},{"name":"containsAny","value":"false"}]}]	13	66	11
2021-11-08 13:37:36.575855	2021-11-08 13:37:36.575855	f	5	f	[{"code":"facet-value-filter","args":[{"name":"facetValueIds","value":"[30]"},{"name":"containsAny","value":"false"}]}]	14	101	1
2021-11-08 13:37:36.594108	2021-11-08 13:37:36.594108	f	1	f	[{"code":"facet-value-filter","args":[{"name":"facetValueIds","value":"[34]"},{"name":"containsAny","value":"false"}]}]	15	100	14
2021-11-08 13:37:36.62527	2021-11-08 13:37:36.62527	f	2	f	[{"code":"facet-value-filter","args":[{"name":"facetValueIds","value":"[31]"},{"name":"containsAny","value":"false"}]}]	16	91	14
2021-11-08 13:37:36.653554	2021-11-08 13:37:36.653554	f	6	f	[{"code":"facet-value-filter","args":[{"name":"facetValueIds","value":"[17]"},{"name":"containsAny","value":"false"}]}]	17	78	1
2021-11-08 13:37:36.675463	2021-11-08 13:37:36.675463	f	1	f	[{"code":"facet-value-filter","args":[{"name":"facetValueIds","value":"[18]"},{"name":"containsAny","value":"false"}]}]	18	77	17
2021-11-08 13:37:36.694078	2021-11-08 13:37:36.694078	f	2	f	[{"code":"facet-value-filter","args":[{"name":"facetValueIds","value":"[23]"},{"name":"containsAny","value":"false"}]}]	19	86	17
\.


--
-- Data for Name: collection_asset; Type: TABLE DATA; Schema: public; Owner: ghienan
--

COPY public.collection_asset ("createdAt", "updatedAt", "assetId", "position", "collectionId", id) FROM stdin;
2021-10-15 15:12:32.852731	2021-10-15 15:12:32.852731	16	0	2	1
2021-10-15 15:12:32.882603	2021-10-15 15:12:32.882603	5	0	3	2
2021-10-15 15:12:32.904412	2021-10-15 15:12:32.904412	12	0	4	3
2021-10-15 15:12:32.931005	2021-10-15 15:12:32.931005	47	0	5	4
2021-10-15 15:12:32.954258	2021-10-15 15:12:32.954258	46	0	6	5
2021-10-15 15:12:32.972454	2021-10-15 15:12:32.972454	37	0	7	6
2021-10-15 15:12:32.988662	2021-10-15 15:12:32.988662	24	0	8	7
2021-10-15 15:12:33.009265	2021-10-15 15:12:33.009265	23	0	9	8
2021-10-15 15:12:33.027575	2021-10-15 15:12:33.027575	32	0	10	9
2021-11-08 13:37:36.504665	2021-11-08 13:37:36.504665	70	0	11	10
2021-11-08 13:37:36.53655	2021-11-08 13:37:36.53655	59	0	12	11
2021-11-08 13:37:36.55979	2021-11-08 13:37:36.55979	66	0	13	12
2021-11-08 13:37:36.579503	2021-11-08 13:37:36.579503	101	0	14	13
2021-11-08 13:37:36.601096	2021-11-08 13:37:36.601096	100	0	15	14
2021-11-08 13:37:36.629816	2021-11-08 13:37:36.629816	91	0	16	15
2021-11-08 13:37:36.658118	2021-11-08 13:37:36.658118	78	0	17	16
2021-11-08 13:37:36.679407	2021-11-08 13:37:36.679407	77	0	18	17
2021-11-08 13:37:36.69894	2021-11-08 13:37:36.69894	86	0	19	18
\.


--
-- Data for Name: collection_channels_channel; Type: TABLE DATA; Schema: public; Owner: ghienan
--

COPY public.collection_channels_channel ("collectionId", "channelId") FROM stdin;
1	1
2	1
3	1
4	1
5	1
6	1
7	1
8	1
9	1
10	1
11	1
12	1
13	1
14	1
15	1
16	1
17	1
18	1
19	1
\.


--
-- Data for Name: collection_product_variants_product_variant; Type: TABLE DATA; Schema: public; Owner: ghienan
--

COPY public.collection_product_variants_product_variant ("collectionId", "productVariantId") FROM stdin;
2	1
2	2
2	3
2	4
2	5
2	6
2	7
2	8
2	9
2	10
2	11
2	12
2	13
2	14
2	15
2	16
2	17
2	18
2	19
2	20
2	21
2	22
2	23
2	24
2	25
2	26
2	27
2	28
2	29
2	30
2	31
2	32
2	33
2	34
3	1
3	2
3	3
3	4
3	5
3	6
3	7
3	8
3	9
3	10
3	11
3	12
3	13
3	14
3	15
3	16
3	17
3	18
3	19
3	20
3	21
3	22
3	23
3	24
3	25
4	26
4	27
4	28
4	29
4	30
4	31
4	32
4	33
4	34
5	67
5	68
5	69
5	70
5	71
5	72
5	73
5	74
5	75
5	76
5	77
5	78
5	79
5	80
5	81
5	82
5	83
5	84
5	85
5	86
5	87
5	88
6	75
6	77
6	78
6	79
6	80
6	81
6	82
6	83
6	84
6	85
6	86
6	87
6	88
7	67
7	68
7	69
7	70
7	71
7	72
7	73
7	74
7	76
8	35
8	36
8	37
8	38
8	39
8	40
8	41
8	42
8	43
8	44
8	45
8	46
8	47
8	48
8	49
8	50
8	51
8	52
8	53
8	54
8	55
8	56
8	57
8	58
8	59
8	60
8	61
8	62
8	63
8	64
8	65
8	66
9	35
9	36
9	37
9	38
9	39
9	40
9	41
9	42
10	43
10	44
10	45
10	46
10	47
10	48
10	49
10	50
10	51
10	52
10	53
10	54
10	55
10	56
10	57
10	58
10	59
10	60
10	61
10	62
10	63
10	64
10	65
10	66
11	1
11	2
11	3
11	4
11	5
11	6
11	7
11	8
11	9
11	10
11	11
11	12
11	13
11	14
11	15
11	16
11	17
11	18
11	19
11	20
11	21
11	22
11	23
11	24
11	25
11	26
11	27
11	28
11	29
11	30
11	31
11	32
11	33
11	34
11	89
11	90
11	91
11	92
11	93
11	94
11	95
11	96
11	97
11	98
11	99
11	100
11	101
11	102
11	103
11	104
11	105
11	106
11	107
11	108
11	109
11	110
11	111
11	112
11	113
11	114
11	115
11	116
11	117
11	118
11	119
11	120
11	121
11	122
12	1
12	2
12	3
12	4
12	5
12	6
12	7
12	8
12	9
12	10
12	11
12	12
12	13
12	14
12	15
12	16
12	17
12	18
12	19
12	20
12	21
12	22
12	23
12	24
12	25
12	89
12	90
12	91
12	92
12	93
12	94
12	95
12	96
12	97
12	98
12	99
12	100
12	101
12	102
12	103
12	104
12	105
12	106
12	107
12	108
12	109
12	110
12	111
12	112
12	113
13	26
13	27
13	28
13	29
13	30
13	31
13	32
13	33
13	34
13	114
13	115
13	116
13	117
13	118
13	119
13	120
13	121
13	122
14	67
14	68
14	69
14	70
14	71
14	72
14	73
14	74
14	75
14	76
14	77
14	78
14	79
14	80
14	81
14	82
14	83
14	84
14	85
14	86
14	87
14	88
14	155
14	156
14	157
14	158
14	159
14	160
14	161
14	162
14	163
14	164
14	165
14	166
14	167
14	168
14	169
14	170
14	171
14	172
14	173
14	174
14	175
14	176
15	75
15	77
15	78
15	79
15	80
15	81
15	82
15	83
15	84
15	85
15	86
15	87
15	88
15	163
15	165
15	166
15	167
15	168
15	169
15	170
15	171
15	172
15	173
15	174
15	175
15	176
16	67
16	68
16	69
16	70
16	71
16	72
16	73
16	74
16	76
16	155
16	156
16	157
16	158
16	159
16	160
16	161
16	162
16	164
17	35
17	36
17	37
17	38
17	39
17	40
17	41
17	42
17	43
17	44
17	45
17	46
17	47
17	48
17	49
17	50
17	51
17	52
17	53
17	54
17	55
17	56
17	57
17	58
17	59
17	60
17	61
17	62
17	63
17	64
17	65
17	66
17	123
17	124
17	125
17	126
17	127
17	128
17	129
17	130
17	131
17	132
17	133
17	134
17	135
17	136
17	137
17	138
17	139
17	140
17	141
17	142
17	143
17	144
17	145
17	146
17	147
17	148
17	149
17	150
17	151
17	152
17	153
17	154
18	35
18	36
18	37
18	38
18	39
18	40
18	41
18	42
18	123
18	124
18	125
18	126
18	127
18	128
18	129
18	130
19	43
19	44
19	45
19	46
19	47
19	48
19	49
19	50
19	51
19	52
19	53
19	54
19	55
19	56
19	57
19	58
19	59
19	60
19	61
19	62
19	63
19	64
19	65
19	66
19	131
19	132
19	133
19	134
19	135
19	136
19	137
19	138
19	139
19	140
19	141
19	142
19	143
19	144
19	145
19	146
19	147
19	148
19	149
19	150
19	151
19	152
19	153
19	154
\.


--
-- Data for Name: collection_translation; Type: TABLE DATA; Schema: public; Owner: ghienan
--

COPY public.collection_translation ("createdAt", "updatedAt", "languageCode", name, slug, description, id, "baseId") FROM stdin;
2021-10-15 15:12:32.827107	2021-10-15 15:12:32.828534	en	__root_collection__	__root_collection__	The root of the Collection tree.	2	1
2021-10-15 15:12:32.821936	2021-10-15 15:12:32.843912	en	Electronics	electronics		1	2
2021-10-15 15:12:32.869477	2021-10-15 15:12:32.877191	en	Computers	computers		3	3
2021-10-15 15:12:32.893524	2021-10-15 15:12:32.899178	en	Camera & Photo	camera-photo		4	4
2021-10-15 15:12:32.917736	2021-10-15 15:12:32.92313	en	Home & Garden	home-garden		5	5
2021-10-15 15:12:32.944498	2021-10-15 15:12:32.95063	en	Furniture	furniture		6	6
2021-10-15 15:12:32.964784	2021-10-15 15:12:32.96885	en	Plants	plants		7	7
2021-10-15 15:12:32.98206	2021-10-15 15:12:32.985095	en	Sports & Outdoor	sports-outdoor		8	8
2021-10-15 15:12:33.000541	2021-10-15 15:12:33.004795	en	Equipment	equipment		9	9
2021-10-15 15:12:33.020426	2021-10-15 15:12:33.024205	en	Footwear	footwear		10	10
2021-11-08 13:37:36.476169	2021-11-08 13:37:36.492969	en	Electronics	electronics-2		11	11
2021-11-08 13:37:36.526485	2021-11-08 13:37:36.532269	en	Computers	computers-2		12	12
2021-11-08 13:37:36.548341	2021-11-08 13:37:36.554642	en	Camera & Photo	camera-photo-2		13	13
2021-11-08 13:37:36.572789	2021-11-08 13:37:36.575855	en	Home & Garden	home-garden-2		14	14
2021-11-08 13:37:36.59017	2021-11-08 13:37:36.594108	en	Furniture	furniture-2		15	15
2021-11-08 13:37:36.617158	2021-11-08 13:37:36.62527	en	Plants	plants-2		16	16
2021-11-08 13:37:36.649586	2021-11-08 13:37:36.653554	en	Sports & Outdoor	sports-outdoor-2		17	17
2021-11-08 13:37:36.671266	2021-11-08 13:37:36.675463	en	Equipment	equipment-2		18	18
2021-11-08 13:37:36.69002	2021-11-08 13:37:36.694078	en	Footwear	footwear-2		19	19
\.


--
-- Data for Name: country; Type: TABLE DATA; Schema: public; Owner: ghienan
--

COPY public.country ("createdAt", "updatedAt", code, enabled, id) FROM stdin;
2021-10-15 15:12:29.607617	2021-10-15 15:12:29.607617	AF	t	1
2021-10-15 15:12:29.622788	2021-10-15 15:12:29.622788	AX	t	2
2021-10-15 15:12:29.634965	2021-10-15 15:12:29.634965	AL	t	3
2021-10-15 15:12:29.63938	2021-10-15 15:12:29.63938	DZ	t	4
2021-10-15 15:12:29.649004	2021-10-15 15:12:29.649004	AS	t	5
2021-10-15 15:12:29.658466	2021-10-15 15:12:29.658466	AD	t	6
2021-10-15 15:12:29.663534	2021-10-15 15:12:29.663534	AO	t	7
2021-10-15 15:12:29.669053	2021-10-15 15:12:29.669053	AI	t	8
2021-10-15 15:12:29.683462	2021-10-15 15:12:29.683462	AG	t	9
2021-10-15 15:12:29.688705	2021-10-15 15:12:29.688705	AR	t	10
2021-10-15 15:12:29.693372	2021-10-15 15:12:29.693372	AM	t	11
2021-10-15 15:12:29.698602	2021-10-15 15:12:29.698602	AW	t	12
2021-10-15 15:12:29.703782	2021-10-15 15:12:29.703782	AU	t	13
2021-10-15 15:12:29.708545	2021-10-15 15:12:29.708545	AT	t	14
2021-10-15 15:12:29.713528	2021-10-15 15:12:29.713528	AZ	t	15
2021-10-15 15:12:29.71844	2021-10-15 15:12:29.71844	BS	t	16
2021-10-15 15:12:29.722696	2021-10-15 15:12:29.722696	BH	t	17
2021-10-15 15:12:29.727553	2021-10-15 15:12:29.727553	BD	t	18
2021-10-15 15:12:29.73508	2021-10-15 15:12:29.73508	BB	t	19
2021-10-15 15:12:29.739806	2021-10-15 15:12:29.739806	BY	t	20
2021-10-15 15:12:29.747339	2021-10-15 15:12:29.747339	BE	t	21
2021-10-15 15:12:29.753009	2021-10-15 15:12:29.753009	BZ	t	22
2021-10-15 15:12:29.758867	2021-10-15 15:12:29.758867	BJ	t	23
2021-10-15 15:12:29.76379	2021-10-15 15:12:29.76379	BM	t	24
2021-10-15 15:12:29.768616	2021-10-15 15:12:29.768616	BT	t	25
2021-10-15 15:12:29.772708	2021-10-15 15:12:29.772708	BO	t	26
2021-10-15 15:12:29.776872	2021-10-15 15:12:29.776872	BQ	t	27
2021-10-15 15:12:29.781469	2021-10-15 15:12:29.781469	BA	t	28
2021-10-15 15:12:29.785815	2021-10-15 15:12:29.785815	BW	t	29
2021-10-15 15:12:29.790771	2021-10-15 15:12:29.790771	BV	t	30
2021-10-15 15:12:29.79469	2021-10-15 15:12:29.79469	BR	t	31
2021-10-15 15:12:29.798628	2021-10-15 15:12:29.798628	IO	t	32
2021-10-15 15:12:29.803509	2021-10-15 15:12:29.803509	BN	t	33
2021-10-15 15:12:29.808409	2021-10-15 15:12:29.808409	BG	t	34
2021-10-15 15:12:29.812817	2021-10-15 15:12:29.812817	BF	t	35
2021-10-15 15:12:29.817106	2021-10-15 15:12:29.817106	BI	t	36
2021-10-15 15:12:29.821407	2021-10-15 15:12:29.821407	CV	t	37
2021-10-15 15:12:29.828172	2021-10-15 15:12:29.828172	KH	t	38
2021-10-15 15:12:29.833006	2021-10-15 15:12:29.833006	CM	t	39
2021-10-15 15:12:29.837218	2021-10-15 15:12:29.837218	CA	t	40
2021-10-15 15:12:29.841547	2021-10-15 15:12:29.841547	KY	t	41
2021-10-15 15:12:29.845324	2021-10-15 15:12:29.845324	CF	t	42
2021-10-15 15:12:29.850033	2021-10-15 15:12:29.850033	TD	t	43
2021-10-15 15:12:29.854687	2021-10-15 15:12:29.854687	CL	t	44
2021-10-15 15:12:29.858423	2021-10-15 15:12:29.858423	CN	t	45
2021-10-15 15:12:29.862122	2021-10-15 15:12:29.862122	CX	t	46
2021-10-15 15:12:29.867695	2021-10-15 15:12:29.867695	CC	t	47
2021-10-15 15:12:29.873388	2021-10-15 15:12:29.873388	CO	t	48
2021-10-15 15:12:29.877493	2021-10-15 15:12:29.877493	KM	t	49
2021-10-15 15:12:29.88203	2021-10-15 15:12:29.88203	CG	t	50
2021-10-15 15:12:29.887608	2021-10-15 15:12:29.887608	CD	t	51
2021-10-15 15:12:29.891936	2021-10-15 15:12:29.891936	CK	t	52
2021-10-15 15:12:29.895562	2021-10-15 15:12:29.895562	CR	t	53
2021-10-15 15:12:29.900062	2021-10-15 15:12:29.900062	CI	t	54
2021-10-15 15:12:29.904255	2021-10-15 15:12:29.904255	HR	t	55
2021-10-15 15:12:29.910763	2021-10-15 15:12:29.910763	CU	t	56
2021-10-15 15:12:29.91572	2021-10-15 15:12:29.91572	CW	t	57
2021-10-15 15:12:29.92147	2021-10-15 15:12:29.92147	CY	t	58
2021-10-15 15:12:29.926163	2021-10-15 15:12:29.926163	CZ	t	59
2021-10-15 15:12:29.932277	2021-10-15 15:12:29.932277	DK	t	60
2021-10-15 15:12:29.9365	2021-10-15 15:12:29.9365	DJ	t	61
2021-10-15 15:12:29.939813	2021-10-15 15:12:29.939813	DM	t	62
2021-10-15 15:12:29.943463	2021-10-15 15:12:29.943463	DO	t	63
2021-10-15 15:12:29.947506	2021-10-15 15:12:29.947506	EC	t	64
2021-10-15 15:12:29.951593	2021-10-15 15:12:29.951593	EG	t	65
2021-10-15 15:12:29.955029	2021-10-15 15:12:29.955029	SV	t	66
2021-10-15 15:12:29.961054	2021-10-15 15:12:29.961054	GQ	t	67
2021-10-15 15:12:29.965954	2021-10-15 15:12:29.965954	ER	t	68
2021-10-15 15:12:29.970168	2021-10-15 15:12:29.970168	EE	t	69
2021-10-15 15:12:29.973638	2021-10-15 15:12:29.973638	SZ	t	70
2021-10-15 15:12:29.977494	2021-10-15 15:12:29.977494	ET	t	71
2021-10-15 15:12:29.981855	2021-10-15 15:12:29.981855	FK	t	72
2021-10-15 15:12:29.985723	2021-10-15 15:12:29.985723	FO	t	73
2021-10-15 15:12:29.988948	2021-10-15 15:12:29.988948	FJ	t	74
2021-10-15 15:12:29.992212	2021-10-15 15:12:29.992212	FI	t	75
2021-10-15 15:12:29.996316	2021-10-15 15:12:29.996316	FR	t	76
2021-10-15 15:12:30.000499	2021-10-15 15:12:30.000499	GF	t	77
2021-10-15 15:12:30.004307	2021-10-15 15:12:30.004307	PF	t	78
2021-10-15 15:12:30.009158	2021-10-15 15:12:30.009158	TF	t	79
2021-10-15 15:12:30.014709	2021-10-15 15:12:30.014709	GA	t	80
2021-10-15 15:12:30.019051	2021-10-15 15:12:30.019051	GM	t	81
2021-10-15 15:12:30.023933	2021-10-15 15:12:30.023933	GE	t	82
2021-10-15 15:12:30.028618	2021-10-15 15:12:30.028618	DE	t	83
2021-10-15 15:12:30.033188	2021-10-15 15:12:30.033188	GH	t	84
2021-10-15 15:12:30.0368	2021-10-15 15:12:30.0368	GI	t	85
2021-10-15 15:12:30.040484	2021-10-15 15:12:30.040484	GR	t	86
2021-10-15 15:12:30.043984	2021-10-15 15:12:30.043984	GL	t	87
2021-10-15 15:12:30.048484	2021-10-15 15:12:30.048484	GD	t	88
2021-10-15 15:12:30.0524	2021-10-15 15:12:30.0524	GP	t	89
2021-10-15 15:12:30.056384	2021-10-15 15:12:30.056384	GU	t	90
2021-10-15 15:12:30.059885	2021-10-15 15:12:30.059885	GT	t	91
2021-10-15 15:12:30.063261	2021-10-15 15:12:30.063261	GG	t	92
2021-10-15 15:12:30.067669	2021-10-15 15:12:30.067669	GN	t	93
2021-10-15 15:12:30.073135	2021-10-15 15:12:30.073135	GW	t	94
2021-10-15 15:12:30.077194	2021-10-15 15:12:30.077194	GY	t	95
2021-10-15 15:12:30.081449	2021-10-15 15:12:30.081449	HT	t	96
2021-10-15 15:12:30.08611	2021-10-15 15:12:30.08611	HM	t	97
2021-10-15 15:12:30.089897	2021-10-15 15:12:30.089897	VA	t	98
2021-10-15 15:12:30.093749	2021-10-15 15:12:30.093749	HN	t	99
2021-10-15 15:12:30.097589	2021-10-15 15:12:30.097589	HK	t	100
2021-10-15 15:12:30.101941	2021-10-15 15:12:30.101941	HU	t	101
2021-10-15 15:12:30.105905	2021-10-15 15:12:30.105905	IS	t	102
2021-10-15 15:12:30.109954	2021-10-15 15:12:30.109954	IN	t	103
2021-10-15 15:12:30.113501	2021-10-15 15:12:30.113501	ID	t	104
2021-10-15 15:12:30.117709	2021-10-15 15:12:30.117709	IR	t	105
2021-10-15 15:12:30.121206	2021-10-15 15:12:30.121206	IQ	t	106
2021-10-15 15:12:30.124918	2021-10-15 15:12:30.124918	IE	t	107
2021-10-15 15:12:30.128691	2021-10-15 15:12:30.128691	IM	t	108
2021-10-15 15:12:30.132478	2021-10-15 15:12:30.132478	IL	t	109
2021-10-15 15:12:30.137176	2021-10-15 15:12:30.137176	IT	t	110
2021-10-15 15:12:30.140855	2021-10-15 15:12:30.140855	JM	t	111
2021-10-15 15:12:30.145739	2021-10-15 15:12:30.145739	JP	t	112
2021-10-15 15:12:30.149592	2021-10-15 15:12:30.149592	JE	t	113
2021-10-15 15:12:30.15533	2021-10-15 15:12:30.15533	JO	t	114
2021-10-15 15:12:30.159173	2021-10-15 15:12:30.159173	KZ	t	115
2021-10-15 15:12:30.163549	2021-10-15 15:12:30.163549	KE	t	116
2021-10-15 15:12:30.168274	2021-10-15 15:12:30.168274	KI	t	117
2021-10-15 15:12:30.171543	2021-10-15 15:12:30.171543	KP	t	118
2021-10-15 15:12:30.175804	2021-10-15 15:12:30.175804	KR	t	119
2021-10-15 15:12:30.179878	2021-10-15 15:12:30.179878	KW	t	120
2021-10-15 15:12:30.184042	2021-10-15 15:12:30.184042	KG	t	121
2021-10-15 15:12:30.187543	2021-10-15 15:12:30.187543	LA	t	122
2021-10-15 15:12:30.190838	2021-10-15 15:12:30.190838	LV	t	123
2021-10-15 15:12:30.194173	2021-10-15 15:12:30.194173	LB	t	124
2021-10-15 15:12:30.19775	2021-10-15 15:12:30.19775	LS	t	125
2021-10-15 15:12:30.201532	2021-10-15 15:12:30.201532	LR	t	126
2021-10-15 15:12:30.204938	2021-10-15 15:12:30.204938	LY	t	127
2021-10-15 15:12:30.20929	2021-10-15 15:12:30.20929	LI	t	128
2021-10-15 15:12:30.213895	2021-10-15 15:12:30.213895	LT	t	129
2021-10-15 15:12:30.217421	2021-10-15 15:12:30.217421	LU	t	130
2021-10-15 15:12:30.221851	2021-10-15 15:12:30.221851	MO	t	131
2021-10-15 15:12:30.225056	2021-10-15 15:12:30.225056	MK	t	132
2021-10-15 15:12:30.228283	2021-10-15 15:12:30.228283	MG	t	133
2021-10-15 15:12:30.231913	2021-10-15 15:12:30.231913	MW	t	134
2021-10-15 15:12:30.235552	2021-10-15 15:12:30.235552	MY	t	135
2021-10-15 15:12:30.240523	2021-10-15 15:12:30.240523	MV	t	136
2021-10-15 15:12:30.245855	2021-10-15 15:12:30.245855	ML	t	137
2021-10-15 15:12:30.250494	2021-10-15 15:12:30.250494	MT	t	138
2021-10-15 15:12:30.254684	2021-10-15 15:12:30.254684	MH	t	139
2021-10-15 15:12:30.258222	2021-10-15 15:12:30.258222	MQ	t	140
2021-10-15 15:12:30.261431	2021-10-15 15:12:30.261431	MR	t	141
2021-10-15 15:12:30.265187	2021-10-15 15:12:30.265187	MU	t	142
2021-10-15 15:12:30.268653	2021-10-15 15:12:30.268653	YT	t	143
2021-10-15 15:12:30.272005	2021-10-15 15:12:30.272005	MX	t	144
2021-10-15 15:12:30.275293	2021-10-15 15:12:30.275293	FM	t	145
2021-10-15 15:12:30.278524	2021-10-15 15:12:30.278524	MD	t	146
2021-10-15 15:12:30.282377	2021-10-15 15:12:30.282377	MC	t	147
2021-10-15 15:12:30.287426	2021-10-15 15:12:30.287426	MN	t	148
2021-10-15 15:12:30.291446	2021-10-15 15:12:30.291446	ME	t	149
2021-10-15 15:12:30.294625	2021-10-15 15:12:30.294625	MS	t	150
2021-10-15 15:12:30.297974	2021-10-15 15:12:30.297974	MA	t	151
2021-10-15 15:12:30.30141	2021-10-15 15:12:30.30141	MZ	t	152
2021-10-15 15:12:30.304657	2021-10-15 15:12:30.304657	MM	t	153
2021-10-15 15:12:30.30781	2021-10-15 15:12:30.30781	NA	t	154
2021-10-15 15:12:30.310991	2021-10-15 15:12:30.310991	NR	t	155
2021-10-15 15:12:30.314499	2021-10-15 15:12:30.314499	NP	t	156
2021-10-15 15:12:30.318846	2021-10-15 15:12:30.318846	NL	t	157
2021-10-15 15:12:30.323088	2021-10-15 15:12:30.323088	NC	t	158
2021-10-15 15:12:30.328427	2021-10-15 15:12:30.328427	NZ	t	159
2021-10-15 15:12:30.334163	2021-10-15 15:12:30.334163	NI	t	160
2021-10-15 15:12:30.338166	2021-10-15 15:12:30.338166	NE	t	161
2021-10-15 15:12:30.3419	2021-10-15 15:12:30.3419	NG	t	162
2021-10-15 15:12:30.34532	2021-10-15 15:12:30.34532	NU	t	163
2021-10-15 15:12:30.349289	2021-10-15 15:12:30.349289	NF	t	164
2021-10-15 15:12:30.353965	2021-10-15 15:12:30.353965	MP	t	165
2021-10-15 15:12:30.357958	2021-10-15 15:12:30.357958	NO	t	166
2021-10-15 15:12:30.361209	2021-10-15 15:12:30.361209	OM	t	167
2021-10-15 15:12:30.366454	2021-10-15 15:12:30.366454	PK	t	168
2021-10-15 15:12:30.370126	2021-10-15 15:12:30.370126	PW	t	169
2021-10-15 15:12:30.374117	2021-10-15 15:12:30.374117	PS	t	170
2021-10-15 15:12:30.377225	2021-10-15 15:12:30.377225	PA	t	171
2021-10-15 15:12:30.380949	2021-10-15 15:12:30.380949	PG	t	172
2021-10-15 15:12:30.384428	2021-10-15 15:12:30.384428	PY	t	173
2021-10-15 15:12:30.38755	2021-10-15 15:12:30.38755	PE	t	174
2021-10-15 15:12:30.39062	2021-10-15 15:12:30.39062	PH	t	175
2021-10-15 15:12:30.393748	2021-10-15 15:12:30.393748	PN	t	176
2021-10-15 15:12:30.397806	2021-10-15 15:12:30.397806	PL	t	177
2021-10-15 15:12:30.401576	2021-10-15 15:12:30.401576	PT	t	178
2021-10-15 15:12:30.404835	2021-10-15 15:12:30.404835	PR	t	179
2021-10-15 15:12:30.408041	2021-10-15 15:12:30.408041	QA	t	180
2021-10-15 15:12:30.411675	2021-10-15 15:12:30.411675	RE	t	181
2021-10-15 15:12:30.416898	2021-10-15 15:12:30.416898	RO	t	182
2021-10-15 15:12:30.422543	2021-10-15 15:12:30.422543	RU	t	183
2021-10-15 15:12:30.42621	2021-10-15 15:12:30.42621	RW	t	184
2021-10-15 15:12:30.429302	2021-10-15 15:12:30.429302	BL	t	185
2021-10-15 15:12:30.432656	2021-10-15 15:12:30.432656	SH	t	186
2021-10-15 15:12:30.435889	2021-10-15 15:12:30.435889	KN	t	187
2021-10-15 15:12:30.438988	2021-10-15 15:12:30.438988	LC	t	188
2021-10-15 15:12:30.442699	2021-10-15 15:12:30.442699	MF	t	189
2021-10-15 15:12:30.445772	2021-10-15 15:12:30.445772	PM	t	190
2021-10-15 15:12:30.449063	2021-10-15 15:12:30.449063	VC	t	191
2021-10-15 15:12:30.45398	2021-10-15 15:12:30.45398	WS	t	192
2021-10-15 15:12:30.457114	2021-10-15 15:12:30.457114	SM	t	193
2021-10-15 15:12:30.460409	2021-10-15 15:12:30.460409	ST	t	194
2021-10-15 15:12:30.463987	2021-10-15 15:12:30.463987	SA	t	195
2021-10-15 15:12:30.46757	2021-10-15 15:12:30.46757	SN	t	196
2021-10-15 15:12:30.471414	2021-10-15 15:12:30.471414	RS	t	197
2021-10-15 15:12:30.474552	2021-10-15 15:12:30.474552	SC	t	198
2021-10-15 15:12:30.47951	2021-10-15 15:12:30.47951	SL	t	199
2021-10-15 15:12:30.483659	2021-10-15 15:12:30.483659	SG	t	200
2021-10-15 15:12:30.487166	2021-10-15 15:12:30.487166	SX	t	201
2021-10-15 15:12:30.491353	2021-10-15 15:12:30.491353	SK	t	202
2021-10-15 15:12:30.495032	2021-10-15 15:12:30.495032	SI	t	203
2021-10-15 15:12:30.498429	2021-10-15 15:12:30.498429	SB	t	204
2021-10-15 15:12:30.501787	2021-10-15 15:12:30.501787	SO	t	205
2021-10-15 15:12:30.505055	2021-10-15 15:12:30.505055	ZA	t	206
2021-10-15 15:12:30.508154	2021-10-15 15:12:30.508154	GS	t	207
2021-10-15 15:12:30.511286	2021-10-15 15:12:30.511286	SS	t	208
2021-10-15 15:12:30.514806	2021-10-15 15:12:30.514806	ES	t	209
2021-10-15 15:12:30.518737	2021-10-15 15:12:30.518737	LK	t	210
2021-10-15 15:12:30.522017	2021-10-15 15:12:30.522017	SD	t	211
2021-10-15 15:12:30.52528	2021-10-15 15:12:30.52528	SR	t	212
2021-10-15 15:12:30.528509	2021-10-15 15:12:30.528509	SJ	t	213
2021-10-15 15:12:30.532878	2021-10-15 15:12:30.532878	SE	t	214
2021-10-15 15:12:30.536724	2021-10-15 15:12:30.536724	CH	t	215
2021-10-15 15:12:30.539802	2021-10-15 15:12:30.539802	SY	t	216
2021-10-15 15:12:30.543386	2021-10-15 15:12:30.543386	TW	t	217
2021-10-15 15:12:30.546568	2021-10-15 15:12:30.546568	TJ	t	218
2021-10-15 15:12:30.550478	2021-10-15 15:12:30.550478	TZ	t	219
2021-10-15 15:12:30.553877	2021-10-15 15:12:30.553877	TH	t	220
2021-10-15 15:12:30.557026	2021-10-15 15:12:30.557026	TL	t	221
2021-10-15 15:12:30.560999	2021-10-15 15:12:30.560999	TG	t	222
2021-10-15 15:12:30.565867	2021-10-15 15:12:30.565867	TK	t	223
2021-10-15 15:12:30.569398	2021-10-15 15:12:30.569398	TO	t	224
2021-10-15 15:12:30.572449	2021-10-15 15:12:30.572449	TT	t	225
2021-10-15 15:12:30.575639	2021-10-15 15:12:30.575639	TN	t	226
2021-10-15 15:12:30.579912	2021-10-15 15:12:30.579912	TR	t	227
2021-10-15 15:12:30.584123	2021-10-15 15:12:30.584123	TM	t	228
2021-10-15 15:12:30.587595	2021-10-15 15:12:30.587595	TC	t	229
2021-10-15 15:12:30.590679	2021-10-15 15:12:30.590679	TV	t	230
2021-10-15 15:12:30.59369	2021-10-15 15:12:30.59369	UG	t	231
2021-10-15 15:12:30.596937	2021-10-15 15:12:30.596937	UA	t	232
2021-10-15 15:12:30.60185	2021-10-15 15:12:30.60185	AE	t	233
2021-10-15 15:12:30.609358	2021-10-15 15:12:30.609358	GB	t	234
2021-10-15 15:12:30.616915	2021-10-15 15:12:30.616915	US	t	235
2021-10-15 15:12:30.620126	2021-10-15 15:12:30.620126	UM	t	236
2021-10-15 15:12:30.623148	2021-10-15 15:12:30.623148	UY	t	237
2021-10-15 15:12:30.626157	2021-10-15 15:12:30.626157	UZ	t	238
2021-10-15 15:12:30.629406	2021-10-15 15:12:30.629406	VU	t	239
2021-10-15 15:12:30.632836	2021-10-15 15:12:30.632836	VE	t	240
2021-10-15 15:12:30.636424	2021-10-15 15:12:30.636424	VN	t	241
2021-10-15 15:12:30.639598	2021-10-15 15:12:30.639598	VG	t	242
2021-10-15 15:12:30.643519	2021-10-15 15:12:30.643519	VI	t	243
2021-10-15 15:12:30.646789	2021-10-15 15:12:30.646789	WF	t	244
2021-10-15 15:12:30.650868	2021-10-15 15:12:30.650868	EH	t	245
2021-10-15 15:12:30.654231	2021-10-15 15:12:30.654231	YE	t	246
2021-10-15 15:12:30.65727	2021-10-15 15:12:30.65727	ZM	t	247
2021-10-15 15:12:30.660939	2021-10-15 15:12:30.660939	ZW	t	248
2021-11-08 13:37:33.102932	2021-11-08 13:37:33.102932	AF	t	249
2021-11-08 13:37:33.146127	2021-11-08 13:37:33.146127	AX	t	250
2021-11-08 13:37:33.167734	2021-11-08 13:37:33.167734	AL	t	251
2021-11-08 13:37:33.174474	2021-11-08 13:37:33.174474	DZ	t	252
2021-11-08 13:37:33.196629	2021-11-08 13:37:33.196629	AS	t	253
2021-11-08 13:37:33.222725	2021-11-08 13:37:33.222725	AD	t	254
2021-11-08 13:37:33.228688	2021-11-08 13:37:33.228688	AO	t	255
2021-11-08 13:37:33.236313	2021-11-08 13:37:33.236313	AI	t	256
2021-11-08 13:37:33.26744	2021-11-08 13:37:33.26744	AG	t	257
2021-11-08 13:37:33.275231	2021-11-08 13:37:33.275231	AR	t	258
2021-11-08 13:37:33.28029	2021-11-08 13:37:33.28029	AM	t	259
2021-11-08 13:37:33.284472	2021-11-08 13:37:33.284472	AW	t	260
2021-11-08 13:37:33.290035	2021-11-08 13:37:33.290035	AU	t	261
2021-11-08 13:37:33.298664	2021-11-08 13:37:33.298664	AT	t	262
2021-11-08 13:37:33.303631	2021-11-08 13:37:33.303631	AZ	t	263
2021-11-08 13:37:33.308931	2021-11-08 13:37:33.308931	BS	t	264
2021-11-08 13:37:33.313328	2021-11-08 13:37:33.313328	BH	t	265
2021-11-08 13:37:33.317642	2021-11-08 13:37:33.317642	BD	t	266
2021-11-08 13:37:33.324315	2021-11-08 13:37:33.324315	BB	t	267
2021-11-08 13:37:33.328624	2021-11-08 13:37:33.328624	BY	t	268
2021-11-08 13:37:33.332185	2021-11-08 13:37:33.332185	BE	t	269
2021-11-08 13:37:33.335791	2021-11-08 13:37:33.335791	BZ	t	270
2021-11-08 13:37:33.34102	2021-11-08 13:37:33.34102	BJ	t	271
2021-11-08 13:37:33.347928	2021-11-08 13:37:33.347928	BM	t	272
2021-11-08 13:37:33.351435	2021-11-08 13:37:33.351435	BT	t	273
2021-11-08 13:37:33.355493	2021-11-08 13:37:33.355493	BO	t	274
2021-11-08 13:37:33.359459	2021-11-08 13:37:33.359459	BQ	t	275
2021-11-08 13:37:33.363083	2021-11-08 13:37:33.363083	BA	t	276
2021-11-08 13:37:33.36716	2021-11-08 13:37:33.36716	BW	t	277
2021-11-08 13:37:33.37148	2021-11-08 13:37:33.37148	BV	t	278
2021-11-08 13:37:33.375445	2021-11-08 13:37:33.375445	BR	t	279
2021-11-08 13:37:33.378859	2021-11-08 13:37:33.378859	IO	t	280
2021-11-08 13:37:33.382762	2021-11-08 13:37:33.382762	BN	t	281
2021-11-08 13:37:33.386492	2021-11-08 13:37:33.386492	BG	t	282
2021-11-08 13:37:33.390492	2021-11-08 13:37:33.390492	BF	t	283
2021-11-08 13:37:33.394384	2021-11-08 13:37:33.394384	BI	t	284
2021-11-08 13:37:33.398924	2021-11-08 13:37:33.398924	CV	t	285
2021-11-08 13:37:33.403109	2021-11-08 13:37:33.403109	KH	t	286
2021-11-08 13:37:33.407514	2021-11-08 13:37:33.407514	CM	t	287
2021-11-08 13:37:33.411361	2021-11-08 13:37:33.411361	CA	t	288
2021-11-08 13:37:33.415154	2021-11-08 13:37:33.415154	KY	t	289
2021-11-08 13:37:33.419009	2021-11-08 13:37:33.419009	CF	t	290
2021-11-08 13:37:33.424106	2021-11-08 13:37:33.424106	TD	t	291
2021-11-08 13:37:33.428958	2021-11-08 13:37:33.428958	CL	t	292
2021-11-08 13:37:33.433267	2021-11-08 13:37:33.433267	CN	t	293
2021-11-08 13:37:33.438571	2021-11-08 13:37:33.438571	CX	t	294
2021-11-08 13:37:33.442567	2021-11-08 13:37:33.442567	CC	t	295
2021-11-08 13:37:33.446373	2021-11-08 13:37:33.446373	CO	t	296
2021-11-08 13:37:33.450551	2021-11-08 13:37:33.450551	KM	t	297
2021-11-08 13:37:33.454992	2021-11-08 13:37:33.454992	CG	t	298
2021-11-08 13:37:33.459002	2021-11-08 13:37:33.459002	CD	t	299
2021-11-08 13:37:33.46303	2021-11-08 13:37:33.46303	CK	t	300
2021-11-08 13:37:33.470485	2021-11-08 13:37:33.470485	CR	t	301
2021-11-08 13:37:33.478518	2021-11-08 13:37:33.478518	CI	t	302
2021-11-08 13:37:33.482708	2021-11-08 13:37:33.482708	HR	t	303
2021-11-08 13:37:33.487168	2021-11-08 13:37:33.487168	CU	t	304
2021-11-08 13:37:33.49141	2021-11-08 13:37:33.49141	CW	t	305
2021-11-08 13:37:33.497265	2021-11-08 13:37:33.497265	CY	t	306
2021-11-08 13:37:33.501545	2021-11-08 13:37:33.501545	CZ	t	307
2021-11-08 13:37:33.506425	2021-11-08 13:37:33.506425	DK	t	308
2021-11-08 13:37:33.511062	2021-11-08 13:37:33.511062	DJ	t	309
2021-11-08 13:37:33.514883	2021-11-08 13:37:33.514883	DM	t	310
2021-11-08 13:37:33.518616	2021-11-08 13:37:33.518616	DO	t	311
2021-11-08 13:37:33.522514	2021-11-08 13:37:33.522514	EC	t	312
2021-11-08 13:37:33.526567	2021-11-08 13:37:33.526567	EG	t	313
2021-11-08 13:37:33.530734	2021-11-08 13:37:33.530734	SV	t	314
2021-11-08 13:37:33.534373	2021-11-08 13:37:33.534373	GQ	t	315
2021-11-08 13:37:33.538557	2021-11-08 13:37:33.538557	ER	t	316
2021-11-08 13:37:33.542322	2021-11-08 13:37:33.542322	EE	t	317
2021-11-08 13:37:33.546029	2021-11-08 13:37:33.546029	SZ	t	318
2021-11-08 13:37:33.549638	2021-11-08 13:37:33.549638	ET	t	319
2021-11-08 13:37:33.554377	2021-11-08 13:37:33.554377	FK	t	320
2021-11-08 13:37:33.55832	2021-11-08 13:37:33.55832	FO	t	321
2021-11-08 13:37:33.563267	2021-11-08 13:37:33.563267	FJ	t	322
2021-11-08 13:37:33.568312	2021-11-08 13:37:33.568312	FI	t	323
2021-11-08 13:37:33.57371	2021-11-08 13:37:33.57371	FR	t	324
2021-11-08 13:37:33.579024	2021-11-08 13:37:33.579024	GF	t	325
2021-11-08 13:37:33.583204	2021-11-08 13:37:33.583204	PF	t	326
2021-11-08 13:37:33.587941	2021-11-08 13:37:33.587941	TF	t	327
2021-11-08 13:37:33.593249	2021-11-08 13:37:33.593249	GA	t	328
2021-11-08 13:37:33.597681	2021-11-08 13:37:33.597681	GM	t	329
2021-11-08 13:37:33.604333	2021-11-08 13:37:33.604333	GE	t	330
2021-11-08 13:37:33.607963	2021-11-08 13:37:33.607963	DE	t	331
2021-11-08 13:37:33.612698	2021-11-08 13:37:33.612698	GH	t	332
2021-11-08 13:37:33.61744	2021-11-08 13:37:33.61744	GI	t	333
2021-11-08 13:37:33.623072	2021-11-08 13:37:33.623072	GR	t	334
2021-11-08 13:37:33.627854	2021-11-08 13:37:33.627854	GL	t	335
2021-11-08 13:37:33.632083	2021-11-08 13:37:33.632083	GD	t	336
2021-11-08 13:37:33.637008	2021-11-08 13:37:33.637008	GP	t	337
2021-11-08 13:37:33.641331	2021-11-08 13:37:33.641331	GU	t	338
2021-11-08 13:37:33.646355	2021-11-08 13:37:33.646355	GT	t	339
2021-11-08 13:37:33.650046	2021-11-08 13:37:33.650046	GG	t	340
2021-11-08 13:37:33.654667	2021-11-08 13:37:33.654667	GN	t	341
2021-11-08 13:37:33.659044	2021-11-08 13:37:33.659044	GW	t	342
2021-11-08 13:37:33.662887	2021-11-08 13:37:33.662887	GY	t	343
2021-11-08 13:37:33.666378	2021-11-08 13:37:33.666378	HT	t	344
2021-11-08 13:37:33.670951	2021-11-08 13:37:33.670951	HM	t	345
2021-11-08 13:37:33.676231	2021-11-08 13:37:33.676231	VA	t	346
2021-11-08 13:37:33.681327	2021-11-08 13:37:33.681327	HN	t	347
2021-11-08 13:37:33.687657	2021-11-08 13:37:33.687657	HK	t	348
2021-11-08 13:37:33.692606	2021-11-08 13:37:33.692606	HU	t	349
2021-11-08 13:37:33.698257	2021-11-08 13:37:33.698257	IS	t	350
2021-11-08 13:37:33.702682	2021-11-08 13:37:33.702682	IN	t	351
2021-11-08 13:37:33.708309	2021-11-08 13:37:33.708309	ID	t	352
2021-11-08 13:37:33.713071	2021-11-08 13:37:33.713071	IR	t	353
2021-11-08 13:37:33.718416	2021-11-08 13:37:33.718416	IQ	t	354
2021-11-08 13:37:33.725986	2021-11-08 13:37:33.725986	IE	t	355
2021-11-08 13:37:33.730865	2021-11-08 13:37:33.730865	IM	t	356
2021-11-08 13:37:33.735393	2021-11-08 13:37:33.735393	IL	t	357
2021-11-08 13:37:33.74243	2021-11-08 13:37:33.74243	IT	t	358
2021-11-08 13:37:33.746801	2021-11-08 13:37:33.746801	JM	t	359
2021-11-08 13:37:33.751403	2021-11-08 13:37:33.751403	JP	t	360
2021-11-08 13:37:33.758112	2021-11-08 13:37:33.758112	JE	t	361
2021-11-08 13:37:33.76375	2021-11-08 13:37:33.76375	JO	t	362
2021-11-08 13:37:33.773326	2021-11-08 13:37:33.773326	KZ	t	363
2021-11-08 13:37:33.778288	2021-11-08 13:37:33.778288	KE	t	364
2021-11-08 13:37:33.782322	2021-11-08 13:37:33.782322	KI	t	365
2021-11-08 13:37:33.78543	2021-11-08 13:37:33.78543	KP	t	366
2021-11-08 13:37:33.790443	2021-11-08 13:37:33.790443	KR	t	367
2021-11-08 13:37:33.79463	2021-11-08 13:37:33.79463	KW	t	368
2021-11-08 13:37:33.799591	2021-11-08 13:37:33.799591	KG	t	369
2021-11-08 13:37:33.805265	2021-11-08 13:37:33.805265	LA	t	370
2021-11-08 13:37:33.81038	2021-11-08 13:37:33.81038	LV	t	371
2021-11-08 13:37:33.813748	2021-11-08 13:37:33.813748	LB	t	372
2021-11-08 13:37:33.816967	2021-11-08 13:37:33.816967	LS	t	373
2021-11-08 13:37:33.823153	2021-11-08 13:37:33.823153	LR	t	374
2021-11-08 13:37:33.826695	2021-11-08 13:37:33.826695	LY	t	375
2021-11-08 13:37:33.830015	2021-11-08 13:37:33.830015	LI	t	376
2021-11-08 13:37:33.833131	2021-11-08 13:37:33.833131	LT	t	377
2021-11-08 13:37:33.836492	2021-11-08 13:37:33.836492	LU	t	378
2021-11-08 13:37:33.843258	2021-11-08 13:37:33.843258	MO	t	379
2021-11-08 13:37:33.847702	2021-11-08 13:37:33.847702	MK	t	380
2021-11-08 13:37:33.850662	2021-11-08 13:37:33.850662	MG	t	381
2021-11-08 13:37:33.855874	2021-11-08 13:37:33.855874	MW	t	382
2021-11-08 13:37:33.859909	2021-11-08 13:37:33.859909	MY	t	383
2021-11-08 13:37:33.863282	2021-11-08 13:37:33.863282	MV	t	384
2021-11-08 13:37:33.866251	2021-11-08 13:37:33.866251	ML	t	385
2021-11-08 13:37:33.869751	2021-11-08 13:37:33.869751	MT	t	386
2021-11-08 13:37:33.873744	2021-11-08 13:37:33.873744	MH	t	387
2021-11-08 13:37:33.87813	2021-11-08 13:37:33.87813	MQ	t	388
2021-11-08 13:37:33.881469	2021-11-08 13:37:33.881469	MR	t	389
2021-11-08 13:37:33.884741	2021-11-08 13:37:33.884741	MU	t	390
2021-11-08 13:37:33.889518	2021-11-08 13:37:33.889518	YT	t	391
2021-11-08 13:37:33.894469	2021-11-08 13:37:33.894469	MX	t	392
2021-11-08 13:37:33.901565	2021-11-08 13:37:33.901565	FM	t	393
2021-11-08 13:37:33.906536	2021-11-08 13:37:33.906536	MD	t	394
2021-11-08 13:37:33.910616	2021-11-08 13:37:33.910616	MC	t	395
2021-11-08 13:37:33.916006	2021-11-08 13:37:33.916006	MN	t	396
2021-11-08 13:37:33.919934	2021-11-08 13:37:33.919934	ME	t	397
2021-11-08 13:37:33.923296	2021-11-08 13:37:33.923296	MS	t	398
2021-11-08 13:37:33.926551	2021-11-08 13:37:33.926551	MA	t	399
2021-11-08 13:37:33.929499	2021-11-08 13:37:33.929499	MZ	t	400
2021-11-08 13:37:33.932388	2021-11-08 13:37:33.932388	MM	t	401
2021-11-08 13:37:33.936969	2021-11-08 13:37:33.936969	NA	t	402
2021-11-08 13:37:33.941347	2021-11-08 13:37:33.941347	NR	t	403
2021-11-08 13:37:33.944409	2021-11-08 13:37:33.944409	NP	t	404
2021-11-08 13:37:33.948374	2021-11-08 13:37:33.948374	NL	t	405
2021-11-08 13:37:33.95208	2021-11-08 13:37:33.95208	NC	t	406
2021-11-08 13:37:33.956966	2021-11-08 13:37:33.956966	NZ	t	407
2021-11-08 13:37:33.960146	2021-11-08 13:37:33.960146	NI	t	408
2021-11-08 13:37:33.963537	2021-11-08 13:37:33.963537	NE	t	409
2021-11-08 13:37:33.96746	2021-11-08 13:37:33.96746	NG	t	410
2021-11-08 13:37:33.972283	2021-11-08 13:37:33.972283	NU	t	411
2021-11-08 13:37:33.976071	2021-11-08 13:37:33.976071	NF	t	412
2021-11-08 13:37:33.980656	2021-11-08 13:37:33.980656	MP	t	413
2021-11-08 13:37:33.984738	2021-11-08 13:37:33.984738	NO	t	414
2021-11-08 13:37:33.989215	2021-11-08 13:37:33.989215	OM	t	415
2021-11-08 13:37:33.992448	2021-11-08 13:37:33.992448	PK	t	416
2021-11-08 13:37:33.996699	2021-11-08 13:37:33.996699	PW	t	417
2021-11-08 13:37:34.000219	2021-11-08 13:37:34.000219	PS	t	418
2021-11-08 13:37:34.003789	2021-11-08 13:37:34.003789	PA	t	419
2021-11-08 13:37:34.007327	2021-11-08 13:37:34.007327	PG	t	420
2021-11-08 13:37:34.010372	2021-11-08 13:37:34.010372	PY	t	421
2021-11-08 13:37:34.014768	2021-11-08 13:37:34.014768	PE	t	422
2021-11-08 13:37:34.017901	2021-11-08 13:37:34.017901	PH	t	423
2021-11-08 13:37:34.022773	2021-11-08 13:37:34.022773	PN	t	424
2021-11-08 13:37:34.025836	2021-11-08 13:37:34.025836	PL	t	425
2021-11-08 13:37:34.028883	2021-11-08 13:37:34.028883	PT	t	426
2021-11-08 13:37:34.031918	2021-11-08 13:37:34.031918	PR	t	427
2021-11-08 13:37:34.0349	2021-11-08 13:37:34.0349	QA	t	428
2021-11-08 13:37:34.038911	2021-11-08 13:37:34.038911	RE	t	429
2021-11-08 13:37:34.041929	2021-11-08 13:37:34.041929	RO	t	430
2021-11-08 13:37:34.046262	2021-11-08 13:37:34.046262	RU	t	431
2021-11-08 13:37:34.049224	2021-11-08 13:37:34.049224	RW	t	432
2021-11-08 13:37:34.052319	2021-11-08 13:37:34.052319	BL	t	433
2021-11-08 13:37:34.056385	2021-11-08 13:37:34.056385	SH	t	434
2021-11-08 13:37:34.060522	2021-11-08 13:37:34.060522	KN	t	435
2021-11-08 13:37:34.064059	2021-11-08 13:37:34.064059	LC	t	436
2021-11-08 13:37:34.067429	2021-11-08 13:37:34.067429	MF	t	437
2021-11-08 13:37:34.071638	2021-11-08 13:37:34.071638	PM	t	438
2021-11-08 13:37:34.074738	2021-11-08 13:37:34.074738	VC	t	439
2021-11-08 13:37:34.077881	2021-11-08 13:37:34.077881	WS	t	440
2021-11-08 13:37:34.081181	2021-11-08 13:37:34.081181	SM	t	441
2021-11-08 13:37:34.084416	2021-11-08 13:37:34.084416	ST	t	442
2021-11-08 13:37:34.090743	2021-11-08 13:37:34.090743	SA	t	443
2021-11-08 13:37:34.094224	2021-11-08 13:37:34.094224	SN	t	444
2021-11-08 13:37:34.097665	2021-11-08 13:37:34.097665	RS	t	445
2021-11-08 13:37:34.102237	2021-11-08 13:37:34.102237	SC	t	446
2021-11-08 13:37:34.107564	2021-11-08 13:37:34.107564	SL	t	447
2021-11-08 13:37:34.11184	2021-11-08 13:37:34.11184	SG	t	448
2021-11-08 13:37:34.115402	2021-11-08 13:37:34.115402	SX	t	449
2021-11-08 13:37:34.121825	2021-11-08 13:37:34.121825	SK	t	450
2021-11-08 13:37:34.126677	2021-11-08 13:37:34.126677	SI	t	451
2021-11-08 13:37:34.129657	2021-11-08 13:37:34.129657	SB	t	452
2021-11-08 13:37:34.132689	2021-11-08 13:37:34.132689	SO	t	453
2021-11-08 13:37:34.136295	2021-11-08 13:37:34.136295	ZA	t	454
2021-11-08 13:37:34.142004	2021-11-08 13:37:34.142004	GS	t	455
2021-11-08 13:37:34.145202	2021-11-08 13:37:34.145202	SS	t	456
2021-11-08 13:37:34.148198	2021-11-08 13:37:34.148198	ES	t	457
2021-11-08 13:37:34.151574	2021-11-08 13:37:34.151574	LK	t	458
2021-11-08 13:37:34.156477	2021-11-08 13:37:34.156477	SD	t	459
2021-11-08 13:37:34.159964	2021-11-08 13:37:34.159964	SR	t	460
2021-11-08 13:37:34.162897	2021-11-08 13:37:34.162897	SJ	t	461
2021-11-08 13:37:34.166085	2021-11-08 13:37:34.166085	SE	t	462
2021-11-08 13:37:34.170543	2021-11-08 13:37:34.170543	CH	t	463
2021-11-08 13:37:34.175288	2021-11-08 13:37:34.175288	SY	t	464
2021-11-08 13:37:34.18004	2021-11-08 13:37:34.18004	TW	t	465
2021-11-08 13:37:34.184061	2021-11-08 13:37:34.184061	TJ	t	466
2021-11-08 13:37:34.188324	2021-11-08 13:37:34.188324	TZ	t	467
2021-11-08 13:37:34.191937	2021-11-08 13:37:34.191937	TH	t	468
2021-11-08 13:37:34.194885	2021-11-08 13:37:34.194885	TL	t	469
2021-11-08 13:37:34.198332	2021-11-08 13:37:34.198332	TG	t	470
2021-11-08 13:37:34.201271	2021-11-08 13:37:34.201271	TK	t	471
2021-11-08 13:37:34.205888	2021-11-08 13:37:34.205888	TO	t	472
2021-11-08 13:37:34.209012	2021-11-08 13:37:34.209012	TT	t	473
2021-11-08 13:37:34.212678	2021-11-08 13:37:34.212678	TN	t	474
2021-11-08 13:37:34.216067	2021-11-08 13:37:34.216067	TR	t	475
2021-11-08 13:37:34.218942	2021-11-08 13:37:34.218942	TM	t	476
2021-11-08 13:37:34.223931	2021-11-08 13:37:34.223931	TC	t	477
2021-11-08 13:37:34.226944	2021-11-08 13:37:34.226944	TV	t	478
2021-11-08 13:37:34.230755	2021-11-08 13:37:34.230755	UG	t	479
2021-11-08 13:37:34.233926	2021-11-08 13:37:34.233926	UA	t	480
2021-11-08 13:37:34.241357	2021-11-08 13:37:34.241357	AE	t	481
2021-11-08 13:37:34.246959	2021-11-08 13:37:34.246959	GB	t	482
2021-11-08 13:37:34.254362	2021-11-08 13:37:34.254362	US	t	483
2021-11-08 13:37:34.260899	2021-11-08 13:37:34.260899	UM	t	484
2021-11-08 13:37:34.264322	2021-11-08 13:37:34.264322	UY	t	485
2021-11-08 13:37:34.267644	2021-11-08 13:37:34.267644	UZ	t	486
2021-11-08 13:37:34.271861	2021-11-08 13:37:34.271861	VU	t	487
2021-11-08 13:37:34.274908	2021-11-08 13:37:34.274908	VE	t	488
2021-11-08 13:37:34.277808	2021-11-08 13:37:34.277808	VN	t	489
2021-11-08 13:37:34.280656	2021-11-08 13:37:34.280656	VG	t	490
2021-11-08 13:37:34.2836	2021-11-08 13:37:34.2836	VI	t	491
2021-11-08 13:37:34.287571	2021-11-08 13:37:34.287571	WF	t	492
2021-11-08 13:37:34.291655	2021-11-08 13:37:34.291655	EH	t	493
2021-11-08 13:37:34.294654	2021-11-08 13:37:34.294654	YE	t	494
2021-11-08 13:37:34.297959	2021-11-08 13:37:34.297959	ZM	t	495
2021-11-08 13:37:34.30138	2021-11-08 13:37:34.30138	ZW	t	496
\.


--
-- Data for Name: country_translation; Type: TABLE DATA; Schema: public; Owner: ghienan
--

COPY public.country_translation ("createdAt", "updatedAt", "languageCode", name, id, "baseId") FROM stdin;
2021-10-15 15:12:29.602455	2021-10-15 15:12:29.607617	en	Afghanistan	1	1
2021-10-15 15:12:29.621272	2021-10-15 15:12:29.622788	en	├àland Islands	2	2
2021-10-15 15:12:29.633083	2021-10-15 15:12:29.634965	en	Albania	3	3
2021-10-15 15:12:29.638042	2021-10-15 15:12:29.63938	en	Algeria	4	4
2021-10-15 15:12:29.647358	2021-10-15 15:12:29.649004	en	American Samoa	5	5
2021-10-15 15:12:29.656926	2021-10-15 15:12:29.658466	en	Andorra	6	6
2021-10-15 15:12:29.661826	2021-10-15 15:12:29.663534	en	Angola	7	7
2021-10-15 15:12:29.667407	2021-10-15 15:12:29.669053	en	Anguilla	8	8
2021-10-15 15:12:29.681813	2021-10-15 15:12:29.683462	en	Antigua and Barbuda	9	9
2021-10-15 15:12:29.687198	2021-10-15 15:12:29.688705	en	Argentina	10	10
2021-10-15 15:12:29.691834	2021-10-15 15:12:29.693372	en	Armenia	11	11
2021-10-15 15:12:29.696696	2021-10-15 15:12:29.698602	en	Aruba	12	12
2021-10-15 15:12:29.702108	2021-10-15 15:12:29.703782	en	Australia	13	13
2021-10-15 15:12:29.70694	2021-10-15 15:12:29.708545	en	Austria	14	14
2021-10-15 15:12:29.711839	2021-10-15 15:12:29.713528	en	Azerbaijan	15	15
2021-10-15 15:12:29.716923	2021-10-15 15:12:29.71844	en	Bahamas	16	16
2021-10-15 15:12:29.721337	2021-10-15 15:12:29.722696	en	Bahrain	17	17
2021-10-15 15:12:29.725508	2021-10-15 15:12:29.727553	en	Bangladesh	18	18
2021-10-15 15:12:29.733482	2021-10-15 15:12:29.73508	en	Barbados	19	19
2021-10-15 15:12:29.738333	2021-10-15 15:12:29.739806	en	Belarus	20	20
2021-10-15 15:12:29.745669	2021-10-15 15:12:29.747339	en	Belgium	21	21
2021-10-15 15:12:29.751161	2021-10-15 15:12:29.753009	en	Belize	22	22
2021-10-15 15:12:29.75727	2021-10-15 15:12:29.758867	en	Benin	23	23
2021-10-15 15:12:29.76198	2021-10-15 15:12:29.76379	en	Bermuda	24	24
2021-10-15 15:12:29.767128	2021-10-15 15:12:29.768616	en	Bhutan	25	25
2021-10-15 15:12:29.7714	2021-10-15 15:12:29.772708	en	Bolivia (Plurinational State of)	26	26
2021-10-15 15:12:29.775566	2021-10-15 15:12:29.776872	en	Bonaire, Sint Eustatius and Saba	27	27
2021-10-15 15:12:29.779716	2021-10-15 15:12:29.781469	en	Bosnia and Herzegovina	28	28
2021-10-15 15:12:29.784495	2021-10-15 15:12:29.785815	en	Botswana	29	29
2021-10-15 15:12:29.789216	2021-10-15 15:12:29.790771	en	Bouvet Island	30	30
2021-10-15 15:12:29.793496	2021-10-15 15:12:29.79469	en	Brazil	31	31
2021-10-15 15:12:29.797357	2021-10-15 15:12:29.798628	en	British Indian Ocean Territory	32	32
2021-10-15 15:12:29.801515	2021-10-15 15:12:29.803509	en	Brunei Darussalam	33	33
2021-10-15 15:12:29.806536	2021-10-15 15:12:29.808409	en	Bulgaria	34	34
2021-10-15 15:12:29.811623	2021-10-15 15:12:29.812817	en	Burkina Faso	35	35
2021-10-15 15:12:29.81572	2021-10-15 15:12:29.817106	en	Burundi	36	36
2021-10-15 15:12:29.819966	2021-10-15 15:12:29.821407	en	Cabo Verde	37	37
2021-10-15 15:12:29.824141	2021-10-15 15:12:29.828172	en	Cambodia	38	38
2021-10-15 15:12:29.83153	2021-10-15 15:12:29.833006	en	Cameroon	39	39
2021-10-15 15:12:29.835862	2021-10-15 15:12:29.837218	en	Canada	40	40
2021-10-15 15:12:29.83985	2021-10-15 15:12:29.841547	en	Cayman Islands	41	41
2021-10-15 15:12:29.844133	2021-10-15 15:12:29.845324	en	Central African Republic	42	42
2021-10-15 15:12:29.848533	2021-10-15 15:12:29.850033	en	Chad	43	43
2021-10-15 15:12:29.853417	2021-10-15 15:12:29.854687	en	Chile	44	44
2021-10-15 15:12:29.857228	2021-10-15 15:12:29.858423	en	China	45	45
2021-10-15 15:12:29.860918	2021-10-15 15:12:29.862122	en	Christmas Island	46	46
2021-10-15 15:12:29.865485	2021-10-15 15:12:29.867695	en	Cocos (Keeling) Islands	47	47
2021-10-15 15:12:29.87068	2021-10-15 15:12:29.873388	en	Colombia	48	48
2021-10-15 15:12:29.876111	2021-10-15 15:12:29.877493	en	Comoros	49	49
2021-10-15 15:12:29.880292	2021-10-15 15:12:29.88203	en	Congo	50	50
2021-10-15 15:12:29.885051	2021-10-15 15:12:29.887608	en	Congo (Democratic Republic of the)	51	51
2021-10-15 15:12:29.890712	2021-10-15 15:12:29.891936	en	Cook Islands	52	52
2021-10-15 15:12:29.894411	2021-10-15 15:12:29.895562	en	Costa Rica	53	53
2021-10-15 15:12:29.898283	2021-10-15 15:12:29.900062	en	C├┤te d'Ivoire	54	54
2021-10-15 15:12:29.903104	2021-10-15 15:12:29.904255	en	Croatia	55	55
2021-10-15 15:12:29.90911	2021-10-15 15:12:29.910763	en	Cuba	56	56
2021-10-15 15:12:29.913653	2021-10-15 15:12:29.91572	en	Cura├ºao	57	57
2021-10-15 15:12:29.918963	2021-10-15 15:12:29.92147	en	Cyprus	58	58
2021-10-15 15:12:29.924463	2021-10-15 15:12:29.926163	en	Czechia	59	59
2021-10-15 15:12:29.929532	2021-10-15 15:12:29.932277	en	Denmark	60	60
2021-10-15 15:12:29.935255	2021-10-15 15:12:29.9365	en	Djibouti	61	61
2021-10-15 15:12:29.938787	2021-10-15 15:12:29.939813	en	Dominica	62	62
2021-10-15 15:12:29.94244	2021-10-15 15:12:29.943463	en	Dominican Republic	63	63
2021-10-15 15:12:29.94599	2021-10-15 15:12:29.947506	en	Ecuador	64	64
2021-10-15 15:12:29.950385	2021-10-15 15:12:29.951593	en	Egypt	65	65
2021-10-15 15:12:29.953905	2021-10-15 15:12:29.955029	en	El Salvador	66	66
2021-10-15 15:12:29.959835	2021-10-15 15:12:29.961054	en	Equatorial Guinea	67	67
2021-10-15 15:12:29.964713	2021-10-15 15:12:29.965954	en	Eritrea	68	68
2021-10-15 15:12:29.96895	2021-10-15 15:12:29.970168	en	Estonia	69	69
2021-10-15 15:12:29.972531	2021-10-15 15:12:29.973638	en	Eswatini	70	70
2021-10-15 15:12:29.976186	2021-10-15 15:12:29.977494	en	Ethiopia	71	71
2021-10-15 15:12:29.980288	2021-10-15 15:12:29.981855	en	Falkland Islands (Malvinas)	72	72
2021-10-15 15:12:29.984495	2021-10-15 15:12:29.985723	en	Faroe Islands	73	73
2021-10-15 15:12:29.987968	2021-10-15 15:12:29.988948	en	Fiji	74	74
2021-10-15 15:12:29.991147	2021-10-15 15:12:29.992212	en	Finland	75	75
2021-10-15 15:12:29.994547	2021-10-15 15:12:29.996316	en	France	76	76
2021-10-15 15:12:29.999192	2021-10-15 15:12:30.000499	en	French Guiana	77	77
2021-10-15 15:12:30.003108	2021-10-15 15:12:30.004307	en	French Polynesia	78	78
2021-10-15 15:12:30.0074	2021-10-15 15:12:30.009158	en	French Southern Territories	79	79
2021-10-15 15:12:30.012073	2021-10-15 15:12:30.014709	en	Gabon	80	80
2021-10-15 15:12:30.017641	2021-10-15 15:12:30.019051	en	Gambia	81	81
2021-10-15 15:12:30.022525	2021-10-15 15:12:30.023933	en	Georgia	82	82
2021-10-15 15:12:30.027441	2021-10-15 15:12:30.028618	en	Germany	83	83
2021-10-15 15:12:30.031557	2021-10-15 15:12:30.033188	en	Ghana	84	84
2021-10-15 15:12:30.035746	2021-10-15 15:12:30.0368	en	Gibraltar	85	85
2021-10-15 15:12:30.039145	2021-10-15 15:12:30.040484	en	Greece	86	86
2021-10-15 15:12:30.042892	2021-10-15 15:12:30.043984	en	Greenland	87	87
2021-10-15 15:12:30.046679	2021-10-15 15:12:30.048484	en	Grenada	88	88
2021-10-15 15:12:30.051191	2021-10-15 15:12:30.0524	en	Guadeloupe	89	89
2021-10-15 15:12:30.05521	2021-10-15 15:12:30.056384	en	Guam	90	90
2021-10-15 15:12:30.058776	2021-10-15 15:12:30.059885	en	Guatemala	91	91
2021-10-15 15:12:30.062188	2021-10-15 15:12:30.063261	en	Guernsey	92	92
2021-10-15 15:12:30.066413	2021-10-15 15:12:30.067669	en	Guinea	93	93
2021-10-15 15:12:30.071	2021-10-15 15:12:30.073135	en	Guinea-Bissau	94	94
2021-10-15 15:12:30.075654	2021-10-15 15:12:30.077194	en	Guyana	95	95
2021-10-15 15:12:30.079906	2021-10-15 15:12:30.081449	en	Haiti	96	96
2021-10-15 15:12:30.083925	2021-10-15 15:12:30.08611	en	Heard Island and McDonald Islands	97	97
2021-10-15 15:12:30.088705	2021-10-15 15:12:30.089897	en	Holy See	98	98
2021-10-15 15:12:30.0925	2021-10-15 15:12:30.093749	en	Honduras	99	99
2021-10-15 15:12:30.096158	2021-10-15 15:12:30.097589	en	Hong Kong	100	100
2021-10-15 15:12:30.100674	2021-10-15 15:12:30.101941	en	Hungary	101	101
2021-10-15 15:12:30.104716	2021-10-15 15:12:30.105905	en	Iceland	102	102
2021-10-15 15:12:30.108661	2021-10-15 15:12:30.109954	en	India	103	103
2021-10-15 15:12:30.112351	2021-10-15 15:12:30.113501	en	Indonesia	104	104
2021-10-15 15:12:30.11634	2021-10-15 15:12:30.117709	en	Iran (Islamic Republic of)	105	105
2021-10-15 15:12:30.120129	2021-10-15 15:12:30.121206	en	Iraq	106	106
2021-10-15 15:12:30.123766	2021-10-15 15:12:30.124918	en	Ireland	107	107
2021-10-15 15:12:30.127573	2021-10-15 15:12:30.128691	en	Isle of Man	108	108
2021-10-15 15:12:30.131333	2021-10-15 15:12:30.132478	en	Israel	109	109
2021-10-15 15:12:30.136086	2021-10-15 15:12:30.137176	en	Italy	110	110
2021-10-15 15:12:30.139401	2021-10-15 15:12:30.140855	en	Jamaica	111	111
2021-10-15 15:12:30.14318	2021-10-15 15:12:30.145739	en	Japan	112	112
2021-10-15 15:12:30.148457	2021-10-15 15:12:30.149592	en	Jersey	113	113
2021-10-15 15:12:30.15391	2021-10-15 15:12:30.15533	en	Jordan	114	114
2021-10-15 15:12:30.158113	2021-10-15 15:12:30.159173	en	Kazakhstan	115	115
2021-10-15 15:12:30.162303	2021-10-15 15:12:30.163549	en	Kenya	116	116
2021-10-15 15:12:30.167013	2021-10-15 15:12:30.168274	en	Kiribati	117	117
2021-10-15 15:12:30.170517	2021-10-15 15:12:30.171543	en	Korea (Democratic People's Republic of)	118	118
2021-10-15 15:12:30.174582	2021-10-15 15:12:30.175804	en	Korea (Republic of)	119	119
2021-10-15 15:12:30.178453	2021-10-15 15:12:30.179878	en	Kuwait	120	120
2021-10-15 15:12:30.182685	2021-10-15 15:12:30.184042	en	Kyrgyzstan	121	121
2021-10-15 15:12:30.186411	2021-10-15 15:12:30.187543	en	Lao People's Democratic Republic	122	122
2021-10-15 15:12:30.189804	2021-10-15 15:12:30.190838	en	Latvia	123	123
2021-10-15 15:12:30.19306	2021-10-15 15:12:30.194173	en	Lebanon	124	124
2021-10-15 15:12:30.196412	2021-10-15 15:12:30.19775	en	Lesotho	125	125
2021-10-15 15:12:30.200319	2021-10-15 15:12:30.201532	en	Liberia	126	126
2021-10-15 15:12:30.203861	2021-10-15 15:12:30.204938	en	Libya	127	127
2021-10-15 15:12:30.207206	2021-10-15 15:12:30.20929	en	Liechtenstein	128	128
2021-10-15 15:12:30.212559	2021-10-15 15:12:30.213895	en	Lithuania	129	129
2021-10-15 15:12:30.216303	2021-10-15 15:12:30.217421	en	Luxembourg	130	130
2021-10-15 15:12:30.220821	2021-10-15 15:12:30.221851	en	Macao	131	131
2021-10-15 15:12:30.224024	2021-10-15 15:12:30.225056	en	Macedonia (the former Yugoslav Republic of)	132	132
2021-10-15 15:12:30.227253	2021-10-15 15:12:30.228283	en	Madagascar	133	133
2021-10-15 15:12:30.230753	2021-10-15 15:12:30.231913	en	Malawi	134	134
2021-10-15 15:12:30.234375	2021-10-15 15:12:30.235552	en	Malaysia	135	135
2021-10-15 15:12:30.238832	2021-10-15 15:12:30.240523	en	Maldives	136	136
2021-10-15 15:12:30.244572	2021-10-15 15:12:30.245855	en	Mali	137	137
2021-10-15 15:12:30.249004	2021-10-15 15:12:30.250494	en	Malta	138	138
2021-10-15 15:12:30.253509	2021-10-15 15:12:30.254684	en	Marshall Islands	139	139
2021-10-15 15:12:30.25715	2021-10-15 15:12:30.258222	en	Martinique	140	140
2021-10-15 15:12:30.260417	2021-10-15 15:12:30.261431	en	Mauritania	141	141
2021-10-15 15:12:30.263829	2021-10-15 15:12:30.265187	en	Mauritius	142	142
2021-10-15 15:12:30.267626	2021-10-15 15:12:30.268653	en	Mayotte	143	143
2021-10-15 15:12:30.270923	2021-10-15 15:12:30.272005	en	Mexico	144	144
2021-10-15 15:12:30.274211	2021-10-15 15:12:30.275293	en	Micronesia (Federated States of)	145	145
2021-10-15 15:12:30.277488	2021-10-15 15:12:30.278524	en	Moldova (Republic of)	146	146
2021-10-15 15:12:30.28115	2021-10-15 15:12:30.282377	en	Monaco	147	147
2021-10-15 15:12:30.285908	2021-10-15 15:12:30.287426	en	Mongolia	148	148
2021-10-15 15:12:30.290372	2021-10-15 15:12:30.291446	en	Montenegro	149	149
2021-10-15 15:12:30.293624	2021-10-15 15:12:30.294625	en	Montserrat	150	150
2021-10-15 15:12:30.296862	2021-10-15 15:12:30.297974	en	Morocco	151	151
2021-10-15 15:12:30.300285	2021-10-15 15:12:30.30141	en	Mozambique	152	152
2021-10-15 15:12:30.303638	2021-10-15 15:12:30.304657	en	Myanmar	153	153
2021-10-15 15:12:30.306808	2021-10-15 15:12:30.30781	en	Namibia	154	154
2021-10-15 15:12:30.309934	2021-10-15 15:12:30.310991	en	Nauru	155	155
2021-10-15 15:12:30.313196	2021-10-15 15:12:30.314499	en	Nepal	156	156
2021-10-15 15:12:30.316967	2021-10-15 15:12:30.318846	en	Netherlands	157	157
2021-10-15 15:12:30.321942	2021-10-15 15:12:30.323088	en	New Caledonia	158	158
2021-10-15 15:12:30.327105	2021-10-15 15:12:30.328427	en	New Zealand	159	159
2021-10-15 15:12:30.332242	2021-10-15 15:12:30.334163	en	Nicaragua	160	160
2021-10-15 15:12:30.33704	2021-10-15 15:12:30.338166	en	Niger	161	161
2021-10-15 15:12:30.340709	2021-10-15 15:12:30.3419	en	Nigeria	162	162
2021-10-15 15:12:30.344211	2021-10-15 15:12:30.34532	en	Niue	163	163
2021-10-15 15:12:30.348076	2021-10-15 15:12:30.349289	en	Norfolk Island	164	164
2021-10-15 15:12:30.352863	2021-10-15 15:12:30.353965	en	Northern Mariana Islands	165	165
2021-10-15 15:12:30.356809	2021-10-15 15:12:30.357958	en	Norway	166	166
2021-10-15 15:12:30.360192	2021-10-15 15:12:30.361209	en	Oman	167	167
2021-10-15 15:12:30.365271	2021-10-15 15:12:30.366454	en	Pakistan	168	168
2021-10-15 15:12:30.369069	2021-10-15 15:12:30.370126	en	Palau	169	169
2021-10-15 15:12:30.373094	2021-10-15 15:12:30.374117	en	Palestine, State of	170	170
2021-10-15 15:12:30.376237	2021-10-15 15:12:30.377225	en	Panama	171	171
2021-10-15 15:12:30.379544	2021-10-15 15:12:30.380949	en	Papua New Guinea	172	172
2021-10-15 15:12:30.383341	2021-10-15 15:12:30.384428	en	Paraguay	173	173
2021-10-15 15:12:30.386565	2021-10-15 15:12:30.38755	en	Peru	174	174
2021-10-15 15:12:30.389642	2021-10-15 15:12:30.39062	en	Philippines	175	175
2021-10-15 15:12:30.392705	2021-10-15 15:12:30.393748	en	Pitcairn	176	176
2021-10-15 15:12:30.396242	2021-10-15 15:12:30.397806	en	Poland	177	177
2021-10-15 15:12:30.400452	2021-10-15 15:12:30.401576	en	Portugal	178	178
2021-10-15 15:12:30.40379	2021-10-15 15:12:30.404835	en	Puerto Rico	179	179
2021-10-15 15:12:30.407007	2021-10-15 15:12:30.408041	en	Qatar	180	180
2021-10-15 15:12:30.410439	2021-10-15 15:12:30.411675	en	R├⌐union	181	181
2021-10-15 15:12:30.414224	2021-10-15 15:12:30.416898	en	Romania	182	182
2021-10-15 15:12:30.420514	2021-10-15 15:12:30.422543	en	Russian Federation	183	183
2021-10-15 15:12:30.425206	2021-10-15 15:12:30.42621	en	Rwanda	184	184
2021-10-15 15:12:30.428315	2021-10-15 15:12:30.429302	en	Saint Barth├⌐lemy	185	185
2021-10-15 15:12:30.431691	2021-10-15 15:12:30.432656	en	Saint Helena, Ascension and Tristan da Cunha	186	186
2021-10-15 15:12:30.434888	2021-10-15 15:12:30.435889	en	Saint Kitts and Nevis	187	187
2021-10-15 15:12:30.437999	2021-10-15 15:12:30.438988	en	Saint Lucia	188	188
2021-10-15 15:12:30.441671	2021-10-15 15:12:30.442699	en	Saint Martin (French part)	189	189
2021-10-15 15:12:30.44479	2021-10-15 15:12:30.445772	en	Saint Pierre and Miquelon	190	190
2021-10-15 15:12:30.448077	2021-10-15 15:12:30.449063	en	Saint Vincent and the Grenadines	191	191
2021-10-15 15:12:30.452964	2021-10-15 15:12:30.45398	en	Samoa	192	192
2021-10-15 15:12:30.456062	2021-10-15 15:12:30.457114	en	San Marino	193	193
2021-10-15 15:12:30.459382	2021-10-15 15:12:30.460409	en	Sao Tome and Principe	194	194
2021-10-15 15:12:30.462668	2021-10-15 15:12:30.463987	en	Saudi Arabia	195	195
2021-10-15 15:12:30.466476	2021-10-15 15:12:30.46757	en	Senegal	196	196
2021-10-15 15:12:30.470366	2021-10-15 15:12:30.471414	en	Serbia	197	197
2021-10-15 15:12:30.473582	2021-10-15 15:12:30.474552	en	Seychelles	198	198
2021-10-15 15:12:30.478462	2021-10-15 15:12:30.47951	en	Sierra Leone	199	199
2021-10-15 15:12:30.481996	2021-10-15 15:12:30.483659	en	Singapore	200	200
2021-10-15 15:12:30.486146	2021-10-15 15:12:30.487166	en	Sint Maarten (Dutch part)	201	201
2021-10-15 15:12:30.489663	2021-10-15 15:12:30.491353	en	Slovakia	202	202
2021-10-15 15:12:30.493985	2021-10-15 15:12:30.495032	en	Slovenia	203	203
2021-10-15 15:12:30.497332	2021-10-15 15:12:30.498429	en	Solomon Islands	204	204
2021-10-15 15:12:30.500728	2021-10-15 15:12:30.501787	en	Somalia	205	205
2021-10-15 15:12:30.504042	2021-10-15 15:12:30.505055	en	South Africa	206	206
2021-10-15 15:12:30.507169	2021-10-15 15:12:30.508154	en	South Georgia and the South Sandwich Islands	207	207
2021-10-15 15:12:30.510236	2021-10-15 15:12:30.511286	en	South Sudan	208	208
2021-10-15 15:12:30.513558	2021-10-15 15:12:30.514806	en	Spain	209	209
2021-10-15 15:12:30.517371	2021-10-15 15:12:30.518737	en	Sri Lanka	210	210
2021-10-15 15:12:30.520995	2021-10-15 15:12:30.522017	en	Sudan	211	211
2021-10-15 15:12:30.52419	2021-10-15 15:12:30.52528	en	Suriname	212	212
2021-10-15 15:12:30.527504	2021-10-15 15:12:30.528509	en	Svalbard and Jan Mayen	213	213
2021-10-15 15:12:30.531607	2021-10-15 15:12:30.532878	en	Sweden	214	214
2021-10-15 15:12:30.535693	2021-10-15 15:12:30.536724	en	Switzerland	215	215
2021-10-15 15:12:30.538834	2021-10-15 15:12:30.539802	en	Syrian Arab Republic	216	216
2021-10-15 15:12:30.542405	2021-10-15 15:12:30.543386	en	Taiwan, Province of China	217	217
2021-10-15 15:12:30.545519	2021-10-15 15:12:30.546568	en	Tajikistan	218	218
2021-10-15 15:12:30.549245	2021-10-15 15:12:30.550478	en	Tanzania, United Republic of	219	219
2021-10-15 15:12:30.552833	2021-10-15 15:12:30.553877	en	Thailand	220	220
2021-10-15 15:12:30.556019	2021-10-15 15:12:30.557026	en	Timor-Leste	221	221
2021-10-15 15:12:30.559212	2021-10-15 15:12:30.560999	en	Togo	222	222
2021-10-15 15:12:30.564448	2021-10-15 15:12:30.565867	en	Tokelau	223	223
2021-10-15 15:12:30.568333	2021-10-15 15:12:30.569398	en	Tonga	224	224
2021-10-15 15:12:30.571484	2021-10-15 15:12:30.572449	en	Trinidad and Tobago	225	225
2021-10-15 15:12:30.574667	2021-10-15 15:12:30.575639	en	Tunisia	226	226
2021-10-15 15:12:30.577785	2021-10-15 15:12:30.579912	en	Turkey	227	227
2021-10-15 15:12:30.582885	2021-10-15 15:12:30.584123	en	Turkmenistan	228	228
2021-10-15 15:12:30.586561	2021-10-15 15:12:30.587595	en	Turks and Caicos Islands	229	229
2021-10-15 15:12:30.589706	2021-10-15 15:12:30.590679	en	Tuvalu	230	230
2021-10-15 15:12:30.592731	2021-10-15 15:12:30.59369	en	Uganda	231	231
2021-10-15 15:12:30.5958	2021-10-15 15:12:30.596937	en	Ukraine	232	232
2021-10-15 15:12:30.599392	2021-10-15 15:12:30.60185	en	United Arab Emirates	233	233
2021-10-15 15:12:30.604982	2021-10-15 15:12:30.609358	en	United Kingdom	234	234
2021-10-15 15:12:30.615761	2021-10-15 15:12:30.616915	en	United States of America	235	235
2021-10-15 15:12:30.619132	2021-10-15 15:12:30.620126	en	United States Minor Outlying Islands	236	236
2021-10-15 15:12:30.622187	2021-10-15 15:12:30.623148	en	Uruguay	237	237
2021-10-15 15:12:30.625195	2021-10-15 15:12:30.626157	en	Uzbekistan	238	238
2021-10-15 15:12:30.628375	2021-10-15 15:12:30.629406	en	Vanuatu	239	239
2021-10-15 15:12:30.631807	2021-10-15 15:12:30.632836	en	Venezuela (Bolivarian Republic of)	240	240
2021-10-15 15:12:30.635348	2021-10-15 15:12:30.636424	en	Viet Nam	241	241
2021-10-15 15:12:30.63859	2021-10-15 15:12:30.639598	en	Virgin Islands (British)	242	242
2021-10-15 15:12:30.642435	2021-10-15 15:12:30.643519	en	Virgin Islands (U.S.)	243	243
2021-10-15 15:12:30.6457	2021-10-15 15:12:30.646789	en	Wallis and Futuna	244	244
2021-10-15 15:12:30.64966	2021-10-15 15:12:30.650868	en	Western Sahara	245	245
2021-10-15 15:12:30.653247	2021-10-15 15:12:30.654231	en	Yemen	246	246
2021-10-15 15:12:30.656307	2021-10-15 15:12:30.65727	en	Zambia	247	247
2021-10-15 15:12:30.659798	2021-10-15 15:12:30.660939	en	Zimbabwe	248	248
2021-11-08 13:37:33.086251	2021-11-08 13:37:33.102932	en	Afghanistan	249	249
2021-11-08 13:37:33.144416	2021-11-08 13:37:33.146127	en	├àland Islands	250	250
2021-11-08 13:37:33.165609	2021-11-08 13:37:33.167734	en	Albania	251	251
2021-11-08 13:37:33.172123	2021-11-08 13:37:33.174474	en	Algeria	252	252
2021-11-08 13:37:33.195005	2021-11-08 13:37:33.196629	en	American Samoa	253	253
2021-11-08 13:37:33.220206	2021-11-08 13:37:33.222725	en	Andorra	254	254
2021-11-08 13:37:33.227265	2021-11-08 13:37:33.228688	en	Angola	255	255
2021-11-08 13:37:33.233865	2021-11-08 13:37:33.236313	en	Anguilla	256	256
2021-11-08 13:37:33.265533	2021-11-08 13:37:33.26744	en	Antigua and Barbuda	257	257
2021-11-08 13:37:33.272059	2021-11-08 13:37:33.275231	en	Argentina	258	258
2021-11-08 13:37:33.278881	2021-11-08 13:37:33.28029	en	Armenia	259	259
2021-11-08 13:37:33.283215	2021-11-08 13:37:33.284472	en	Aruba	260	260
2021-11-08 13:37:33.288373	2021-11-08 13:37:33.290035	en	Australia	261	261
2021-11-08 13:37:33.297179	2021-11-08 13:37:33.298664	en	Austria	262	262
2021-11-08 13:37:33.301725	2021-11-08 13:37:33.303631	en	Azerbaijan	263	263
2021-11-08 13:37:33.307447	2021-11-08 13:37:33.308931	en	Bahamas	264	264
2021-11-08 13:37:33.311959	2021-11-08 13:37:33.313328	en	Bahrain	265	265
2021-11-08 13:37:33.316284	2021-11-08 13:37:33.317642	en	Bangladesh	266	266
2021-11-08 13:37:33.322625	2021-11-08 13:37:33.324315	en	Barbados	267	267
2021-11-08 13:37:33.327449	2021-11-08 13:37:33.328624	en	Belarus	268	268
2021-11-08 13:37:33.331095	2021-11-08 13:37:33.332185	en	Belgium	269	269
2021-11-08 13:37:33.334671	2021-11-08 13:37:33.335791	en	Belize	270	270
2021-11-08 13:37:33.339859	2021-11-08 13:37:33.34102	en	Benin	271	271
2021-11-08 13:37:33.344422	2021-11-08 13:37:33.347928	en	Bermuda	272	272
2021-11-08 13:37:33.350406	2021-11-08 13:37:33.351435	en	Bhutan	273	273
2021-11-08 13:37:33.354298	2021-11-08 13:37:33.355493	en	Bolivia (Plurinational State of)	274	274
2021-11-08 13:37:33.358178	2021-11-08 13:37:33.359459	en	Bonaire, Sint Eustatius and Saba	275	275
2021-11-08 13:37:33.362049	2021-11-08 13:37:33.363083	en	Bosnia and Herzegovina	276	276
2021-11-08 13:37:33.365443	2021-11-08 13:37:33.36716	en	Botswana	277	277
2021-11-08 13:37:33.369729	2021-11-08 13:37:33.37148	en	Bouvet Island	278	278
2021-11-08 13:37:33.374399	2021-11-08 13:37:33.375445	en	Brazil	279	279
2021-11-08 13:37:33.377827	2021-11-08 13:37:33.378859	en	British Indian Ocean Territory	280	280
2021-11-08 13:37:33.381547	2021-11-08 13:37:33.382762	en	Brunei Darussalam	281	281
2021-11-08 13:37:33.385235	2021-11-08 13:37:33.386492	en	Bulgaria	282	282
2021-11-08 13:37:33.38929	2021-11-08 13:37:33.390492	en	Burkina Faso	283	283
2021-11-08 13:37:33.393152	2021-11-08 13:37:33.394384	en	Burundi	284	284
2021-11-08 13:37:33.397572	2021-11-08 13:37:33.398924	en	Cabo Verde	285	285
2021-11-08 13:37:33.401676	2021-11-08 13:37:33.403109	en	Cambodia	286	286
2021-11-08 13:37:33.406233	2021-11-08 13:37:33.407514	en	Cameroon	287	287
2021-11-08 13:37:33.410158	2021-11-08 13:37:33.411361	en	Canada	288	288
2021-11-08 13:37:33.413955	2021-11-08 13:37:33.415154	en	Cayman Islands	289	289
2021-11-08 13:37:33.41777	2021-11-08 13:37:33.419009	en	Central African Republic	290	290
2021-11-08 13:37:33.422136	2021-11-08 13:37:33.424106	en	Chad	291	291
2021-11-08 13:37:33.427554	2021-11-08 13:37:33.428958	en	Chile	292	292
2021-11-08 13:37:33.431985	2021-11-08 13:37:33.433267	en	China	293	293
2021-11-08 13:37:33.436741	2021-11-08 13:37:33.438571	en	Christmas Island	294	294
2021-11-08 13:37:33.441356	2021-11-08 13:37:33.442567	en	Cocos (Keeling) Islands	295	295
2021-11-08 13:37:33.445178	2021-11-08 13:37:33.446373	en	Colombia	296	296
2021-11-08 13:37:33.449246	2021-11-08 13:37:33.450551	en	Comoros	297	297
2021-11-08 13:37:33.45356	2021-11-08 13:37:33.454992	en	Congo	298	298
2021-11-08 13:37:33.45774	2021-11-08 13:37:33.459002	en	Congo (Democratic Republic of the)	299	299
2021-11-08 13:37:33.461768	2021-11-08 13:37:33.46303	en	Cook Islands	300	300
2021-11-08 13:37:33.468585	2021-11-08 13:37:33.470485	en	Costa Rica	301	301
2021-11-08 13:37:33.477165	2021-11-08 13:37:33.478518	en	C├┤te d'Ivoire	302	302
2021-11-08 13:37:33.481372	2021-11-08 13:37:33.482708	en	Croatia	303	303
2021-11-08 13:37:33.485609	2021-11-08 13:37:33.487168	en	Cuba	304	304
2021-11-08 13:37:33.490069	2021-11-08 13:37:33.49141	en	Cura├ºao	305	305
2021-11-08 13:37:33.495477	2021-11-08 13:37:33.497265	en	Cyprus	306	306
2021-11-08 13:37:33.500193	2021-11-08 13:37:33.501545	en	Czechia	307	307
2021-11-08 13:37:33.505131	2021-11-08 13:37:33.506425	en	Denmark	308	308
2021-11-08 13:37:33.509551	2021-11-08 13:37:33.511062	en	Djibouti	309	309
2021-11-08 13:37:33.513708	2021-11-08 13:37:33.514883	en	Dominica	310	310
2021-11-08 13:37:33.517368	2021-11-08 13:37:33.518616	en	Dominican Republic	311	311
2021-11-08 13:37:33.521327	2021-11-08 13:37:33.522514	en	Ecuador	312	312
2021-11-08 13:37:33.5252	2021-11-08 13:37:33.526567	en	Egypt	313	313
2021-11-08 13:37:33.529576	2021-11-08 13:37:33.530734	en	El Salvador	314	314
2021-11-08 13:37:33.533239	2021-11-08 13:37:33.534373	en	Equatorial Guinea	315	315
2021-11-08 13:37:33.5373	2021-11-08 13:37:33.538557	en	Eritrea	316	316
2021-11-08 13:37:33.541096	2021-11-08 13:37:33.542322	en	Estonia	317	317
2021-11-08 13:37:33.544876	2021-11-08 13:37:33.546029	en	Eswatini	318	318
2021-11-08 13:37:33.548526	2021-11-08 13:37:33.549638	en	Ethiopia	319	319
2021-11-08 13:37:33.552837	2021-11-08 13:37:33.554377	en	Falkland Islands (Malvinas)	320	320
2021-11-08 13:37:33.557101	2021-11-08 13:37:33.55832	en	Faroe Islands	321	321
2021-11-08 13:37:33.562064	2021-11-08 13:37:33.563267	en	Fiji	322	322
2021-11-08 13:37:33.566451	2021-11-08 13:37:33.568312	en	Finland	323	323
2021-11-08 13:37:33.572453	2021-11-08 13:37:33.57371	en	France	324	324
2021-11-08 13:37:33.577701	2021-11-08 13:37:33.579024	en	French Guiana	325	325
2021-11-08 13:37:33.581975	2021-11-08 13:37:33.583204	en	French Polynesia	326	326
2021-11-08 13:37:33.586399	2021-11-08 13:37:33.587941	en	French Southern Territories	327	327
2021-11-08 13:37:33.591789	2021-11-08 13:37:33.593249	en	Gabon	328	328
2021-11-08 13:37:33.596441	2021-11-08 13:37:33.597681	en	Gambia	329	329
2021-11-08 13:37:33.603037	2021-11-08 13:37:33.604333	en	Georgia	330	330
2021-11-08 13:37:33.606854	2021-11-08 13:37:33.607963	en	Germany	331	331
2021-11-08 13:37:33.611599	2021-11-08 13:37:33.612698	en	Ghana	332	332
2021-11-08 13:37:33.615573	2021-11-08 13:37:33.61744	en	Gibraltar	333	333
2021-11-08 13:37:33.621561	2021-11-08 13:37:33.623072	en	Greece	334	334
2021-11-08 13:37:33.626632	2021-11-08 13:37:33.627854	en	Greenland	335	335
2021-11-08 13:37:33.630814	2021-11-08 13:37:33.632083	en	Grenada	336	336
2021-11-08 13:37:33.634598	2021-11-08 13:37:33.637008	en	Guadeloupe	337	337
2021-11-08 13:37:33.639833	2021-11-08 13:37:33.641331	en	Guam	338	338
2021-11-08 13:37:33.645102	2021-11-08 13:37:33.646355	en	Guatemala	339	339
2021-11-08 13:37:33.64889	2021-11-08 13:37:33.650046	en	Guernsey	340	340
2021-11-08 13:37:33.652542	2021-11-08 13:37:33.654667	en	Guinea	341	341
2021-11-08 13:37:33.657908	2021-11-08 13:37:33.659044	en	Guinea-Bissau	342	342
2021-11-08 13:37:33.661564	2021-11-08 13:37:33.662887	en	Guyana	343	343
2021-11-08 13:37:33.665304	2021-11-08 13:37:33.666378	en	Haiti	344	344
2021-11-08 13:37:33.668893	2021-11-08 13:37:33.670951	en	Heard Island and McDonald Islands	345	345
2021-11-08 13:37:33.67434	2021-11-08 13:37:33.676231	en	Holy See	346	346
2021-11-08 13:37:33.67953	2021-11-08 13:37:33.681327	en	Honduras	347	347
2021-11-08 13:37:33.685459	2021-11-08 13:37:33.687657	en	Hong Kong	348	348
2021-11-08 13:37:33.691343	2021-11-08 13:37:33.692606	en	Hungary	349	349
2021-11-08 13:37:33.695652	2021-11-08 13:37:33.698257	en	Iceland	350	350
2021-11-08 13:37:33.70096	2021-11-08 13:37:33.702682	en	India	351	351
2021-11-08 13:37:33.707053	2021-11-08 13:37:33.708309	en	Indonesia	352	352
2021-11-08 13:37:33.711543	2021-11-08 13:37:33.713071	en	Iran (Islamic Republic of)	353	353
2021-11-08 13:37:33.716861	2021-11-08 13:37:33.718416	en	Iraq	354	354
2021-11-08 13:37:33.724239	2021-11-08 13:37:33.725986	en	Ireland	355	355
2021-11-08 13:37:33.72941	2021-11-08 13:37:33.730865	en	Isle of Man	356	356
2021-11-08 13:37:33.733953	2021-11-08 13:37:33.735393	en	Israel	357	357
2021-11-08 13:37:33.74105	2021-11-08 13:37:33.74243	en	Italy	358	358
2021-11-08 13:37:33.745516	2021-11-08 13:37:33.746801	en	Jamaica	359	359
2021-11-08 13:37:33.75013	2021-11-08 13:37:33.751403	en	Japan	360	360
2021-11-08 13:37:33.756476	2021-11-08 13:37:33.758112	en	Jersey	361	361
2021-11-08 13:37:33.762474	2021-11-08 13:37:33.76375	en	Jordan	362	362
2021-11-08 13:37:33.768563	2021-11-08 13:37:33.773326	en	Kazakhstan	363	363
2021-11-08 13:37:33.776619	2021-11-08 13:37:33.778288	en	Kenya	364	364
2021-11-08 13:37:33.781304	2021-11-08 13:37:33.782322	en	Kiribati	365	365
2021-11-08 13:37:33.784442	2021-11-08 13:37:33.78543	en	Korea (Democratic People's Republic of)	366	366
2021-11-08 13:37:33.789364	2021-11-08 13:37:33.790443	en	Korea (Republic of)	367	367
2021-11-08 13:37:33.793252	2021-11-08 13:37:33.79463	en	Kuwait	368	368
2021-11-08 13:37:33.798542	2021-11-08 13:37:33.799591	en	Kyrgyzstan	369	369
2021-11-08 13:37:33.802823	2021-11-08 13:37:33.805265	en	Lao People's Democratic Republic	370	370
2021-11-08 13:37:33.809133	2021-11-08 13:37:33.81038	en	Latvia	371	371
2021-11-08 13:37:33.812588	2021-11-08 13:37:33.813748	en	Lebanon	372	372
2021-11-08 13:37:33.815957	2021-11-08 13:37:33.816967	en	Lesotho	373	373
2021-11-08 13:37:33.821108	2021-11-08 13:37:33.823153	en	Liberia	374	374
2021-11-08 13:37:33.825771	2021-11-08 13:37:33.826695	en	Libya	375	375
2021-11-08 13:37:33.828884	2021-11-08 13:37:33.830015	en	Liechtenstein	376	376
2021-11-08 13:37:33.8322	2021-11-08 13:37:33.833131	en	Lithuania	377	377
2021-11-08 13:37:33.835269	2021-11-08 13:37:33.836492	en	Luxembourg	378	378
2021-11-08 13:37:33.841223	2021-11-08 13:37:33.843258	en	Macao	379	379
2021-11-08 13:37:33.846749	2021-11-08 13:37:33.847702	en	Macedonia (the former Yugoslav Republic of)	380	380
2021-11-08 13:37:33.84977	2021-11-08 13:37:33.850662	en	Madagascar	381	381
2021-11-08 13:37:33.852974	2021-11-08 13:37:33.855874	en	Malawi	382	382
2021-11-08 13:37:33.858964	2021-11-08 13:37:33.859909	en	Malaysia	383	383
2021-11-08 13:37:33.862325	2021-11-08 13:37:33.863282	en	Maldives	384	384
2021-11-08 13:37:33.865365	2021-11-08 13:37:33.866251	en	Mali	385	385
2021-11-08 13:37:33.868362	2021-11-08 13:37:33.869751	en	Malta	386	386
2021-11-08 13:37:33.87278	2021-11-08 13:37:33.873744	en	Marshall Islands	387	387
2021-11-08 13:37:33.875973	2021-11-08 13:37:33.87813	en	Martinique	388	388
2021-11-08 13:37:33.880506	2021-11-08 13:37:33.881469	en	Mauritania	389	389
2021-11-08 13:37:33.883653	2021-11-08 13:37:33.884741	en	Mauritius	390	390
2021-11-08 13:37:33.887885	2021-11-08 13:37:33.889518	en	Mayotte	391	391
2021-11-08 13:37:33.891954	2021-11-08 13:37:33.894469	en	Mexico	392	392
2021-11-08 13:37:33.90014	2021-11-08 13:37:33.901565	en	Micronesia (Federated States of)	393	393
2021-11-08 13:37:33.905264	2021-11-08 13:37:33.906536	en	Moldova (Republic of)	394	394
2021-11-08 13:37:33.909268	2021-11-08 13:37:33.910616	en	Monaco	395	395
2021-11-08 13:37:33.913306	2021-11-08 13:37:33.916006	en	Mongolia	396	396
2021-11-08 13:37:33.918607	2021-11-08 13:37:33.919934	en	Montenegro	397	397
2021-11-08 13:37:33.922255	2021-11-08 13:37:33.923296	en	Montserrat	398	398
2021-11-08 13:37:33.925611	2021-11-08 13:37:33.926551	en	Morocco	399	399
2021-11-08 13:37:33.928627	2021-11-08 13:37:33.929499	en	Mozambique	400	400
2021-11-08 13:37:33.931514	2021-11-08 13:37:33.932388	en	Myanmar	401	401
2021-11-08 13:37:33.935144	2021-11-08 13:37:33.936969	en	Namibia	402	402
2021-11-08 13:37:33.940295	2021-11-08 13:37:33.941347	en	Nauru	403	403
2021-11-08 13:37:33.943534	2021-11-08 13:37:33.944409	en	Nepal	404	404
2021-11-08 13:37:33.946433	2021-11-08 13:37:33.948374	en	Netherlands	405	405
2021-11-08 13:37:33.950871	2021-11-08 13:37:33.95208	en	New Caledonia	406	406
2021-11-08 13:37:33.955876	2021-11-08 13:37:33.956966	en	New Zealand	407	407
2021-11-08 13:37:33.959264	2021-11-08 13:37:33.960146	en	Nicaragua	408	408
2021-11-08 13:37:33.962666	2021-11-08 13:37:33.963537	en	Niger	409	409
2021-11-08 13:37:33.966496	2021-11-08 13:37:33.96746	en	Nigeria	410	410
2021-11-08 13:37:33.970018	2021-11-08 13:37:33.972283	en	Niue	411	411
2021-11-08 13:37:33.974673	2021-11-08 13:37:33.976071	en	Norfolk Island	412	412
2021-11-08 13:37:33.978449	2021-11-08 13:37:33.980656	en	Northern Mariana Islands	413	413
2021-11-08 13:37:33.983401	2021-11-08 13:37:33.984738	en	Norway	414	414
2021-11-08 13:37:33.987971	2021-11-08 13:37:33.989215	en	Oman	415	415
2021-11-08 13:37:33.991537	2021-11-08 13:37:33.992448	en	Pakistan	416	416
2021-11-08 13:37:33.995176	2021-11-08 13:37:33.996699	en	Palau	417	417
2021-11-08 13:37:33.999321	2021-11-08 13:37:34.000219	en	Palestine, State of	418	418
2021-11-08 13:37:34.002268	2021-11-08 13:37:34.003789	en	Panama	419	419
2021-11-08 13:37:34.006417	2021-11-08 13:37:34.007327	en	Papua New Guinea	420	420
2021-11-08 13:37:34.009385	2021-11-08 13:37:34.010372	en	Paraguay	421	421
2021-11-08 13:37:34.013757	2021-11-08 13:37:34.014768	en	Peru	422	422
2021-11-08 13:37:34.016964	2021-11-08 13:37:34.017901	en	Philippines	423	423
2021-11-08 13:37:34.021768	2021-11-08 13:37:34.022773	en	Pitcairn	424	424
2021-11-08 13:37:34.024911	2021-11-08 13:37:34.025836	en	Poland	425	425
2021-11-08 13:37:34.027984	2021-11-08 13:37:34.028883	en	Portugal	426	426
2021-11-08 13:37:34.031045	2021-11-08 13:37:34.031918	en	Puerto Rico	427	427
2021-11-08 13:37:34.033949	2021-11-08 13:37:34.0349	en	Qatar	428	428
2021-11-08 13:37:34.037873	2021-11-08 13:37:34.038911	en	R├⌐union	429	429
2021-11-08 13:37:34.041072	2021-11-08 13:37:34.041929	en	Romania	430	430
2021-11-08 13:37:34.045247	2021-11-08 13:37:34.046262	en	Russian Federation	431	431
2021-11-08 13:37:34.048363	2021-11-08 13:37:34.049224	en	Rwanda	432	432
2021-11-08 13:37:34.051361	2021-11-08 13:37:34.052319	en	Saint Barth├⌐lemy	433	433
2021-11-08 13:37:34.055409	2021-11-08 13:37:34.056385	en	Saint Helena, Ascension and Tristan da Cunha	434	434
2021-11-08 13:37:34.058484	2021-11-08 13:37:34.060522	en	Saint Kitts and Nevis	435	435
2021-11-08 13:37:34.063117	2021-11-08 13:37:34.064059	en	Saint Lucia	436	436
2021-11-08 13:37:34.066236	2021-11-08 13:37:34.067429	en	Saint Martin (French part)	437	437
2021-11-08 13:37:34.07018	2021-11-08 13:37:34.071638	en	Saint Pierre and Miquelon	438	438
2021-11-08 13:37:34.073875	2021-11-08 13:37:34.074738	en	Saint Vincent and the Grenadines	439	439
2021-11-08 13:37:34.07685	2021-11-08 13:37:34.077881	en	Samoa	440	440
2021-11-08 13:37:34.080054	2021-11-08 13:37:34.081181	en	San Marino	441	441
2021-11-08 13:37:34.083444	2021-11-08 13:37:34.084416	en	Sao Tome and Principe	442	442
2021-11-08 13:37:34.087554	2021-11-08 13:37:34.090743	en	Saudi Arabia	443	443
2021-11-08 13:37:34.093206	2021-11-08 13:37:34.094224	en	Senegal	444	444
2021-11-08 13:37:34.096618	2021-11-08 13:37:34.097665	en	Serbia	445	445
2021-11-08 13:37:34.100097	2021-11-08 13:37:34.102237	en	Seychelles	446	446
2021-11-08 13:37:34.106478	2021-11-08 13:37:34.107564	en	Sierra Leone	447	447
2021-11-08 13:37:34.110414	2021-11-08 13:37:34.11184	en	Singapore	448	448
2021-11-08 13:37:34.114345	2021-11-08 13:37:34.115402	en	Sint Maarten (Dutch part)	449	449
2021-11-08 13:37:34.119265	2021-11-08 13:37:34.121825	en	Slovakia	450	450
2021-11-08 13:37:34.125604	2021-11-08 13:37:34.126677	en	Slovenia	451	451
2021-11-08 13:37:34.128795	2021-11-08 13:37:34.129657	en	Solomon Islands	452	452
2021-11-08 13:37:34.131688	2021-11-08 13:37:34.132689	en	Somalia	453	453
2021-11-08 13:37:34.13513	2021-11-08 13:37:34.136295	en	South Africa	454	454
2021-11-08 13:37:34.140592	2021-11-08 13:37:34.142004	en	South Georgia and the South Sandwich Islands	455	455
2021-11-08 13:37:34.14428	2021-11-08 13:37:34.145202	en	South Sudan	456	456
2021-11-08 13:37:34.147332	2021-11-08 13:37:34.148198	en	Spain	457	457
2021-11-08 13:37:34.150617	2021-11-08 13:37:34.151574	en	Sri Lanka	458	458
2021-11-08 13:37:34.154853	2021-11-08 13:37:34.156477	en	Sudan	459	459
2021-11-08 13:37:34.15907	2021-11-08 13:37:34.159964	en	Suriname	460	460
2021-11-08 13:37:34.161983	2021-11-08 13:37:34.162897	en	Svalbard and Jan Mayen	461	461
2021-11-08 13:37:34.164994	2021-11-08 13:37:34.166085	en	Sweden	462	462
2021-11-08 13:37:34.169058	2021-11-08 13:37:34.170543	en	Switzerland	463	463
2021-11-08 13:37:34.174262	2021-11-08 13:37:34.175288	en	Syrian Arab Republic	464	464
2021-11-08 13:37:34.178417	2021-11-08 13:37:34.18004	en	Taiwan, Province of China	465	465
2021-11-08 13:37:34.182904	2021-11-08 13:37:34.184061	en	Tajikistan	466	466
2021-11-08 13:37:34.186806	2021-11-08 13:37:34.188324	en	Tanzania, United Republic of	467	467
2021-11-08 13:37:34.191002	2021-11-08 13:37:34.191937	en	Thailand	468	468
2021-11-08 13:37:34.19399	2021-11-08 13:37:34.194885	en	Timor-Leste	469	469
2021-11-08 13:37:34.197332	2021-11-08 13:37:34.198332	en	Togo	470	470
2021-11-08 13:37:34.200376	2021-11-08 13:37:34.201271	en	Tokelau	471	471
2021-11-08 13:37:34.204485	2021-11-08 13:37:34.205888	en	Tonga	472	472
2021-11-08 13:37:34.208145	2021-11-08 13:37:34.209012	en	Trinidad and Tobago	473	473
2021-11-08 13:37:34.211722	2021-11-08 13:37:34.212678	en	Tunisia	474	474
2021-11-08 13:37:34.215141	2021-11-08 13:37:34.216067	en	Turkey	475	475
2021-11-08 13:37:34.218089	2021-11-08 13:37:34.218942	en	Turkmenistan	476	476
2021-11-08 13:37:34.222869	2021-11-08 13:37:34.223931	en	Turks and Caicos Islands	477	477
2021-11-08 13:37:34.226044	2021-11-08 13:37:34.226944	en	Tuvalu	478	478
2021-11-08 13:37:34.228992	2021-11-08 13:37:34.230755	en	Uganda	479	479
2021-11-08 13:37:34.232921	2021-11-08 13:37:34.233926	en	Ukraine	480	480
2021-11-08 13:37:34.239537	2021-11-08 13:37:34.241357	en	United Arab Emirates	481	481
2021-11-08 13:37:34.245365	2021-11-08 13:37:34.246959	en	United Kingdom	482	482
2021-11-08 13:37:34.251721	2021-11-08 13:37:34.254362	en	United States of America	483	483
2021-11-08 13:37:34.259313	2021-11-08 13:37:34.260899	en	United States Minor Outlying Islands	484	484
2021-11-08 13:37:34.263396	2021-11-08 13:37:34.264322	en	Uruguay	485	485
2021-11-08 13:37:34.26643	2021-11-08 13:37:34.267644	en	Uzbekistan	486	486
2021-11-08 13:37:34.270663	2021-11-08 13:37:34.271861	en	Vanuatu	487	487
2021-11-08 13:37:34.274011	2021-11-08 13:37:34.274908	en	Venezuela (Bolivarian Republic of)	488	488
2021-11-08 13:37:34.276894	2021-11-08 13:37:34.277808	en	Viet Nam	489	489
2021-11-08 13:37:34.279779	2021-11-08 13:37:34.280656	en	Virgin Islands (British)	490	490
2021-11-08 13:37:34.282697	2021-11-08 13:37:34.2836	en	Virgin Islands (U.S.)	491	491
2021-11-08 13:37:34.285828	2021-11-08 13:37:34.287571	en	Wallis and Futuna	492	492
2021-11-08 13:37:34.290482	2021-11-08 13:37:34.291655	en	Western Sahara	493	493
2021-11-08 13:37:34.293762	2021-11-08 13:37:34.294654	en	Yemen	494	494
2021-11-08 13:37:34.297055	2021-11-08 13:37:34.297959	en	Zambia	495	495
2021-11-08 13:37:34.300331	2021-11-08 13:37:34.30138	en	Zimbabwe	496	496
\.


--
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: ghienan
--

COPY public.customer ("createdAt", "updatedAt", "deletedAt", title, "firstName", "lastName", "phoneNumber", "emailAddress", id, "userId") FROM stdin;
\.


--
-- Data for Name: customer_channels_channel; Type: TABLE DATA; Schema: public; Owner: ghienan
--

COPY public.customer_channels_channel ("customerId", "channelId") FROM stdin;
\.


--
-- Data for Name: customer_group; Type: TABLE DATA; Schema: public; Owner: ghienan
--

COPY public.customer_group ("createdAt", "updatedAt", name, id) FROM stdin;
\.


--
-- Data for Name: customer_groups_customer_group; Type: TABLE DATA; Schema: public; Owner: ghienan
--

COPY public.customer_groups_customer_group ("customerId", "customerGroupId") FROM stdin;
\.


--
-- Data for Name: facet; Type: TABLE DATA; Schema: public; Owner: ghienan
--

COPY public.facet ("createdAt", "updatedAt", "isPrivate", code, id) FROM stdin;
2021-10-15 15:12:31.045923	2021-10-15 15:12:31.045923	f	category	1
2021-10-15 15:12:31.088647	2021-10-15 15:12:31.088647	f	brand	2
2021-10-15 15:12:31.941655	2021-10-15 15:12:31.941655	f	color	3
2021-10-15 15:12:32.338666	2021-10-15 15:12:32.338666	f	plant-type	4
2021-11-08 13:37:36.049464	2021-11-08 13:37:36.049464	f	plant-type-2	5
\.


--
-- Data for Name: facet_channels_channel; Type: TABLE DATA; Schema: public; Owner: ghienan
--

COPY public.facet_channels_channel ("facetId", "channelId") FROM stdin;
1	1
2	1
3	1
4	1
5	1
\.


--
-- Data for Name: facet_translation; Type: TABLE DATA; Schema: public; Owner: ghienan
--

COPY public.facet_translation ("createdAt", "updatedAt", "languageCode", name, id, "baseId") FROM stdin;
2021-10-15 15:12:31.042677	2021-10-15 15:12:31.045923	en	category	1	1
2021-10-15 15:12:31.08615	2021-10-15 15:12:31.088647	en	brand	2	2
2021-10-15 15:12:31.939234	2021-10-15 15:12:31.941655	en	color	3	3
2021-10-15 15:12:32.336569	2021-10-15 15:12:32.338666	en	plant type	4	4
2021-11-08 13:37:36.044077	2021-11-08 13:37:36.049464	en	plant type	5	5
\.


--
-- Data for Name: facet_value; Type: TABLE DATA; Schema: public; Owner: ghienan
--

COPY public.facet_value ("createdAt", "updatedAt", code, id, "facetId") FROM stdin;
2021-10-15 15:12:31.06098	2021-10-15 15:12:31.06098	electronics	1	1
2021-10-15 15:12:31.075219	2021-10-15 15:12:31.075219	computers	2	1
2021-10-15 15:12:31.101939	2021-10-15 15:12:31.101939	apple	3	2
2021-10-15 15:12:31.235446	2021-10-15 15:12:31.235446	logitech	4	2
2021-10-15 15:12:31.259478	2021-10-15 15:12:31.259478	samsung	5	2
2021-10-15 15:12:31.320086	2021-10-15 15:12:31.320086	corsair	6	2
2021-10-15 15:12:31.367476	2021-10-15 15:12:31.367476	admi	7	2
2021-10-15 15:12:31.436523	2021-10-15 15:12:31.436523	seagate	8	2
2021-10-15 15:12:31.552003	2021-10-15 15:12:31.552003	photo	9	1
2021-10-15 15:12:31.556154	2021-10-15 15:12:31.556154	polaroid	10	2
2021-10-15 15:12:31.579584	2021-10-15 15:12:31.579584	nikkon	11	2
2021-10-15 15:12:31.602964	2021-10-15 15:12:31.602964	agfa	12	2
2021-10-15 15:12:31.622511	2021-10-15 15:12:31.622511	manfrotto	13	2
2021-10-15 15:12:31.644435	2021-10-15 15:12:31.644435	kodak	14	2
2021-10-15 15:12:31.667116	2021-10-15 15:12:31.667116	sony	15	2
2021-10-15 15:12:31.721989	2021-10-15 15:12:31.721989	rolleiflex	16	2
2021-10-15 15:12:31.742901	2021-10-15 15:12:31.742901	sports-outdoor	17	1
2021-10-15 15:12:31.747338	2021-10-15 15:12:31.747338	equipment	18	1
2021-10-15 15:12:31.753602	2021-10-15 15:12:31.753602	pinarello	19	2
2021-10-15 15:12:31.776176	2021-10-15 15:12:31.776176	everlast	20	2
2021-10-15 15:12:31.865585	2021-10-15 15:12:31.865585	nike	21	2
2021-10-15 15:12:31.89145	2021-10-15 15:12:31.89145	wilson	22	2
2021-10-15 15:12:31.928369	2021-10-15 15:12:31.928369	footwear	23	1
2021-10-15 15:12:31.933285	2021-10-15 15:12:31.933285	adidas	24	2
2021-10-15 15:12:31.951596	2021-10-15 15:12:31.951596	blue	25	3
2021-10-15 15:12:31.956447	2021-10-15 15:12:31.956447	pink	26	3
2021-10-15 15:12:32.01974	2021-10-15 15:12:32.01974	black	27	3
2021-10-15 15:12:32.077217	2021-10-15 15:12:32.077217	white	28	3
2021-10-15 15:12:32.238249	2021-10-15 15:12:32.238249	converse	29	2
2021-10-15 15:12:32.326203	2021-10-15 15:12:32.326203	home-garden	30	1
2021-10-15 15:12:32.330556	2021-10-15 15:12:32.330556	plants	31	1
2021-10-15 15:12:32.34939	2021-10-15 15:12:32.34939	indoor	32	4
2021-10-15 15:12:32.374422	2021-10-15 15:12:32.374422	outdoor	33	4
2021-10-15 15:12:32.492439	2021-10-15 15:12:32.492439	furniture	34	1
2021-10-15 15:12:32.49942	2021-10-15 15:12:32.49942	gray	35	3
2021-10-15 15:12:32.624907	2021-10-15 15:12:32.624907	brown	36	3
2021-10-15 15:12:32.665522	2021-10-15 15:12:32.665522	wood	37	3
2021-10-15 15:12:32.778799	2021-10-15 15:12:32.778799	yellow	38	3
2021-10-15 15:12:32.793307	2021-10-15 15:12:32.793307	green	39	3
2021-11-08 13:37:36.066379	2021-11-08 13:37:36.066379	indoor	40	5
2021-11-08 13:37:36.095435	2021-11-08 13:37:36.095435	outdoor	41	5
\.


--
-- Data for Name: facet_value_channels_channel; Type: TABLE DATA; Schema: public; Owner: ghienan
--

COPY public.facet_value_channels_channel ("facetValueId", "channelId") FROM stdin;
1	1
2	1
3	1
4	1
5	1
6	1
7	1
8	1
9	1
10	1
11	1
12	1
13	1
14	1
15	1
16	1
17	1
18	1
19	1
20	1
21	1
22	1
23	1
24	1
25	1
26	1
27	1
28	1
29	1
30	1
31	1
32	1
33	1
34	1
35	1
36	1
37	1
38	1
39	1
40	1
41	1
\.


--
-- Data for Name: facet_value_translation; Type: TABLE DATA; Schema: public; Owner: ghienan
--

COPY public.facet_value_translation ("createdAt", "updatedAt", "languageCode", name, id, "baseId") FROM stdin;
2021-10-15 15:12:31.058753	2021-10-15 15:12:31.06098	en	Electronics	1	1
2021-10-15 15:12:31.073282	2021-10-15 15:12:31.075219	en	Computers	2	2
2021-10-15 15:12:31.100158	2021-10-15 15:12:31.101939	en	Apple	3	3
2021-10-15 15:12:31.233963	2021-10-15 15:12:31.235446	en	Logitech	4	4
2021-10-15 15:12:31.257976	2021-10-15 15:12:31.259478	en	Samsung	5	5
2021-10-15 15:12:31.319021	2021-10-15 15:12:31.320086	en	Corsair	6	6
2021-10-15 15:12:31.366296	2021-10-15 15:12:31.367476	en	ADMI	7	7
2021-10-15 15:12:31.435487	2021-10-15 15:12:31.436523	en	Seagate	8	8
2021-10-15 15:12:31.550967	2021-10-15 15:12:31.552003	en	Photo	9	9
2021-10-15 15:12:31.555114	2021-10-15 15:12:31.556154	en	Polaroid	10	10
2021-10-15 15:12:31.578418	2021-10-15 15:12:31.579584	en	Nikkon	11	11
2021-10-15 15:12:31.601988	2021-10-15 15:12:31.602964	en	Agfa	12	12
2021-10-15 15:12:31.62149	2021-10-15 15:12:31.622511	en	Manfrotto	13	13
2021-10-15 15:12:31.643445	2021-10-15 15:12:31.644435	en	Kodak	14	14
2021-10-15 15:12:31.66595	2021-10-15 15:12:31.667116	en	Sony	15	15
2021-10-15 15:12:31.720954	2021-10-15 15:12:31.721989	en	Rolleiflex	16	16
2021-10-15 15:12:31.741882	2021-10-15 15:12:31.742901	en	Sports & Outdoor	17	17
2021-10-15 15:12:31.746004	2021-10-15 15:12:31.747338	en	Equipment	18	18
2021-10-15 15:12:31.750657	2021-10-15 15:12:31.753602	en	Pinarello	19	19
2021-10-15 15:12:31.77509	2021-10-15 15:12:31.776176	en	Everlast	20	20
2021-10-15 15:12:31.86368	2021-10-15 15:12:31.865585	en	Nike	21	21
2021-10-15 15:12:31.890244	2021-10-15 15:12:31.89145	en	Wilson	22	22
2021-10-15 15:12:31.927444	2021-10-15 15:12:31.928369	en	Footwear	23	23
2021-10-15 15:12:31.932036	2021-10-15 15:12:31.933285	en	Adidas	24	24
2021-10-15 15:12:31.950405	2021-10-15 15:12:31.951596	en	blue	25	25
2021-10-15 15:12:31.95512	2021-10-15 15:12:31.956447	en	pink	26	26
2021-10-15 15:12:32.018636	2021-10-15 15:12:32.01974	en	black	27	27
2021-10-15 15:12:32.07611	2021-10-15 15:12:32.077217	en	white	28	28
2021-10-15 15:12:32.236519	2021-10-15 15:12:32.238249	en	Converse	29	29
2021-10-15 15:12:32.325318	2021-10-15 15:12:32.326203	en	Home & Garden	30	30
2021-10-15 15:12:32.32936	2021-10-15 15:12:32.330556	en	Plants	31	31
2021-10-15 15:12:32.348176	2021-10-15 15:12:32.34939	en	Indoor	32	32
2021-10-15 15:12:32.373399	2021-10-15 15:12:32.374422	en	Outdoor	33	33
2021-10-15 15:12:32.491548	2021-10-15 15:12:32.492439	en	Furniture	34	34
2021-10-15 15:12:32.496642	2021-10-15 15:12:32.49942	en	gray	35	35
2021-10-15 15:12:32.623797	2021-10-15 15:12:32.624907	en	brown	36	36
2021-10-15 15:12:32.663925	2021-10-15 15:12:32.665522	en	wood	37	37
2021-10-15 15:12:32.777524	2021-10-15 15:12:32.778799	en	yellow	38	38
2021-10-15 15:12:32.791381	2021-10-15 15:12:32.793307	en	green	39	39
2021-11-08 13:37:36.063703	2021-11-08 13:37:36.066379	en	Indoor	40	40
2021-11-08 13:37:36.094381	2021-11-08 13:37:36.095435	en	Outdoor	41	41
\.


--
-- Data for Name: fulfillment; Type: TABLE DATA; Schema: public; Owner: ghienan
--

COPY public.fulfillment ("createdAt", "updatedAt", state, "trackingCode", method, "handlerCode", id) FROM stdin;
\.


--
-- Data for Name: global_settings; Type: TABLE DATA; Schema: public; Owner: ghienan
--

COPY public.global_settings ("createdAt", "updatedAt", "availableLanguages", "trackInventory", "outOfStockThreshold", id) FROM stdin;
2021-10-15 15:12:29.123669	2021-10-15 15:12:29.123669	en	t	0	1
\.


--
-- Data for Name: history_entry; Type: TABLE DATA; Schema: public; Owner: ghienan
--

COPY public.history_entry ("createdAt", "updatedAt", type, "isPublic", data, id, discriminator, "administratorId", "customerId", "orderId") FROM stdin;
\.


--
-- Data for Name: job_record; Type: TABLE DATA; Schema: public; Owner: ghienan
--

COPY public.job_record ("createdAt", "updatedAt", "queueName", data, state, progress, result, error, "startedAt", "settledAt", "isSettled", retries, attempts, id) FROM stdin;
2021-10-15 15:12:32.855644	2021-10-15 15:12:32.946397	apply-collection-filters	{"ctx":{"_apiType":"admin","_channel":{"token":"qmp15bmbp0p5zc38dy8","createdAt":"2021-10-15T08:12:29.135Z","updatedAt":"2021-10-15T08:12:30.956Z","code":"__default_channel__","defaultLanguageCode":"en","currencyCode":"USD","pricesIncludeTax":false,"id":1,"defaultShippingZone":{"createdAt":"2021-10-15T08:12:29.625Z","updatedAt":"2021-10-15T08:12:29.625Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2021-10-15T08:12:29.625Z","updatedAt":"2021-10-15T08:12:29.625Z","name":"Europe","id":2}},"_languageCode":"en","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"collectionIds":[2]}	COMPLETED	100	\N	\N	2021-10-15 15:12:32.907	2021-10-15 15:12:32.944	t	0	1	1
2021-10-15 15:12:32.884308	2021-10-15 15:12:33.164952	apply-collection-filters	{"ctx":{"_apiType":"admin","_channel":{"token":"qmp15bmbp0p5zc38dy8","createdAt":"2021-10-15T08:12:29.135Z","updatedAt":"2021-10-15T08:12:30.956Z","code":"__default_channel__","defaultLanguageCode":"en","currencyCode":"USD","pricesIncludeTax":false,"id":1,"defaultShippingZone":{"createdAt":"2021-10-15T08:12:29.625Z","updatedAt":"2021-10-15T08:12:29.625Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2021-10-15T08:12:29.625Z","updatedAt":"2021-10-15T08:12:29.625Z","name":"Europe","id":2}},"_languageCode":"en","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"collectionIds":[3]}	COMPLETED	100	\N	\N	2021-10-15 15:12:33.128	2021-10-15 15:12:33.163	t	0	1	2
2021-10-15 15:12:32.905965	2021-10-15 15:12:33.396746	apply-collection-filters	{"ctx":{"_apiType":"admin","_channel":{"token":"qmp15bmbp0p5zc38dy8","createdAt":"2021-10-15T08:12:29.135Z","updatedAt":"2021-10-15T08:12:30.956Z","code":"__default_channel__","defaultLanguageCode":"en","currencyCode":"USD","pricesIncludeTax":false,"id":1,"defaultShippingZone":{"createdAt":"2021-10-15T08:12:29.625Z","updatedAt":"2021-10-15T08:12:29.625Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2021-10-15T08:12:29.625Z","updatedAt":"2021-10-15T08:12:29.625Z","name":"Europe","id":2}},"_languageCode":"en","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"collectionIds":[4]}	COMPLETED	100	\N	\N	2021-10-15 15:12:33.361	2021-10-15 15:12:33.395	t	0	1	3
2021-10-15 15:12:32.932774	2021-10-15 15:12:33.588068	apply-collection-filters	{"ctx":{"_apiType":"admin","_channel":{"token":"qmp15bmbp0p5zc38dy8","createdAt":"2021-10-15T08:12:29.135Z","updatedAt":"2021-10-15T08:12:30.956Z","code":"__default_channel__","defaultLanguageCode":"en","currencyCode":"USD","pricesIncludeTax":false,"id":1,"defaultShippingZone":{"createdAt":"2021-10-15T08:12:29.625Z","updatedAt":"2021-10-15T08:12:29.625Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2021-10-15T08:12:29.625Z","updatedAt":"2021-10-15T08:12:29.625Z","name":"Europe","id":2}},"_languageCode":"en","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"collectionIds":[5]}	COMPLETED	100	\N	\N	2021-10-15 15:12:33.573	2021-10-15 15:12:33.586	t	0	1	4
2021-10-15 15:12:32.955529	2021-10-15 15:12:33.814827	apply-collection-filters	{"ctx":{"_apiType":"admin","_channel":{"token":"qmp15bmbp0p5zc38dy8","createdAt":"2021-10-15T08:12:29.135Z","updatedAt":"2021-10-15T08:12:30.956Z","code":"__default_channel__","defaultLanguageCode":"en","currencyCode":"USD","pricesIncludeTax":false,"id":1,"defaultShippingZone":{"createdAt":"2021-10-15T08:12:29.625Z","updatedAt":"2021-10-15T08:12:29.625Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2021-10-15T08:12:29.625Z","updatedAt":"2021-10-15T08:12:29.625Z","name":"Europe","id":2}},"_languageCode":"en","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"collectionIds":[6]}	COMPLETED	100	\N	\N	2021-10-15 15:12:33.778	2021-10-15 15:12:33.813	t	0	1	5
2021-10-15 15:12:32.973765	2021-10-15 15:12:34.01582	apply-collection-filters	{"ctx":{"_apiType":"admin","_channel":{"token":"qmp15bmbp0p5zc38dy8","createdAt":"2021-10-15T08:12:29.135Z","updatedAt":"2021-10-15T08:12:30.956Z","code":"__default_channel__","defaultLanguageCode":"en","currencyCode":"USD","pricesIncludeTax":false,"id":1,"defaultShippingZone":{"createdAt":"2021-10-15T08:12:29.625Z","updatedAt":"2021-10-15T08:12:29.625Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2021-10-15T08:12:29.625Z","updatedAt":"2021-10-15T08:12:29.625Z","name":"Europe","id":2}},"_languageCode":"en","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"collectionIds":[7]}	COMPLETED	100	\N	\N	2021-10-15 15:12:33.989	2021-10-15 15:12:34.014	t	0	1	6
2021-10-15 15:12:32.989867	2021-10-15 15:12:34.227614	apply-collection-filters	{"ctx":{"_apiType":"admin","_channel":{"token":"qmp15bmbp0p5zc38dy8","createdAt":"2021-10-15T08:12:29.135Z","updatedAt":"2021-10-15T08:12:30.956Z","code":"__default_channel__","defaultLanguageCode":"en","currencyCode":"USD","pricesIncludeTax":false,"id":1,"defaultShippingZone":{"createdAt":"2021-10-15T08:12:29.625Z","updatedAt":"2021-10-15T08:12:29.625Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2021-10-15T08:12:29.625Z","updatedAt":"2021-10-15T08:12:29.625Z","name":"Europe","id":2}},"_languageCode":"en","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"collectionIds":[8]}	COMPLETED	100	\N	\N	2021-10-15 15:12:34.202	2021-10-15 15:12:34.226	t	0	1	7
2021-10-15 15:12:33.125152	2021-10-15 15:12:34.096667	update-search-index	{"type":"reindex","ctx":{"_apiType":"admin","_channel":{"token":"qmp15bmbp0p5zc38dy8","createdAt":"2021-10-15T08:12:29.135Z","updatedAt":"2021-10-15T08:12:30.956Z","code":"__default_channel__","defaultLanguageCode":"en","currencyCode":"USD","pricesIncludeTax":false,"id":1,"defaultShippingZone":{"createdAt":"2021-10-15T08:12:29.625Z","updatedAt":"2021-10-15T08:12:29.625Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2021-10-15T08:12:29.625Z","updatedAt":"2021-10-15T08:12:29.625Z","name":"Europe","id":2}},"_languageCode":"en","_isAuthorized":true,"_authorizedAsOwnerOnly":false}}	COMPLETED	100	{"success":true,"indexedItemCount":88,"timeTaken":626}	\N	2021-10-15 15:12:33.463	2021-10-15 15:12:34.095	t	0	1	11
2021-10-15 15:12:33.21406	2021-10-15 15:12:34.482541	update-search-index	{"type":"update-variants-by-id","ctx":{"_apiType":"admin","_channel":{"token":"qmp15bmbp0p5zc38dy8","createdAt":"2021-10-15T08:12:29.135Z","updatedAt":"2021-10-15T08:12:30.956Z","code":"__default_channel__","defaultLanguageCode":"en","currencyCode":"USD","pricesIncludeTax":false,"id":1,"defaultShippingZone":{"createdAt":"2021-10-15T08:12:29.625Z","updatedAt":"2021-10-15T08:12:29.625Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2021-10-15T08:12:29.625Z","updatedAt":"2021-10-15T08:12:29.625Z","name":"Europe","id":2}},"_session":{},"_languageCode":"en","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"ids":[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25]}	COMPLETED	100	{"success":true,"indexedItemCount":25,"timeTaken":181}	\N	2021-10-15 15:12:34.296	2021-10-15 15:12:34.481	t	0	1	12
2021-10-15 15:12:32.996911	2021-10-15 15:12:33.306284	update-search-index	{"type":"update-variants-by-id","ctx":{"_apiType":"admin","_channel":{"token":"qmp15bmbp0p5zc38dy8","createdAt":"2021-10-15T08:12:29.135Z","updatedAt":"2021-10-15T08:12:30.956Z","code":"__default_channel__","defaultLanguageCode":"en","currencyCode":"USD","pricesIncludeTax":false,"id":1,"defaultShippingZone":{"createdAt":"2021-10-15T08:12:29.625Z","updatedAt":"2021-10-15T08:12:29.625Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2021-10-15T08:12:29.625Z","updatedAt":"2021-10-15T08:12:29.625Z","name":"Europe","id":2}},"_session":{},"_languageCode":"en","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"ids":[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34]}	COMPLETED	100	{"success":true,"indexedItemCount":34,"timeTaken":266}	\N	2021-10-15 15:12:33.035	2021-10-15 15:12:33.304	t	0	1	8
2021-10-15 15:12:33.446585	2021-10-15 15:12:34.615688	update-search-index	{"type":"update-variants-by-id","ctx":{"_apiType":"admin","_channel":{"token":"qmp15bmbp0p5zc38dy8","createdAt":"2021-10-15T08:12:29.135Z","updatedAt":"2021-10-15T08:12:30.956Z","code":"__default_channel__","defaultLanguageCode":"en","currencyCode":"USD","pricesIncludeTax":false,"id":1,"defaultShippingZone":{"createdAt":"2021-10-15T08:12:29.625Z","updatedAt":"2021-10-15T08:12:29.625Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2021-10-15T08:12:29.625Z","updatedAt":"2021-10-15T08:12:29.625Z","name":"Europe","id":2}},"_session":{},"_languageCode":"en","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"ids":[26,27,28,29,30,31,32,33,34]}	COMPLETED	100	{"success":true,"indexedItemCount":9,"timeTaken":86}	\N	2021-10-15 15:12:34.521	2021-10-15 15:12:34.614	t	0	1	13
2021-10-15 15:12:33.681848	2021-10-15 15:12:34.961433	update-search-index	{"type":"update-variants-by-id","ctx":{"_apiType":"admin","_channel":{"token":"qmp15bmbp0p5zc38dy8","createdAt":"2021-10-15T08:12:29.135Z","updatedAt":"2021-10-15T08:12:30.956Z","code":"__default_channel__","defaultLanguageCode":"en","currencyCode":"USD","pricesIncludeTax":false,"id":1,"defaultShippingZone":{"createdAt":"2021-10-15T08:12:29.625Z","updatedAt":"2021-10-15T08:12:29.625Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2021-10-15T08:12:29.625Z","updatedAt":"2021-10-15T08:12:29.625Z","name":"Europe","id":2}},"_session":{},"_languageCode":"en","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"ids":[67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88]}	COMPLETED	100	{"success":true,"indexedItemCount":22,"timeTaken":195}	\N	2021-10-15 15:12:34.755	2021-10-15 15:12:34.96	t	0	1	14
2021-10-15 15:12:34.281045	2021-10-15 15:13:27.719871	update-search-index	{"type":"update-variants-by-id","ctx":{"_apiType":"admin","_channel":{"token":"qmp15bmbp0p5zc38dy8","createdAt":"2021-10-15T08:12:29.135Z","updatedAt":"2021-10-15T08:12:30.956Z","code":"__default_channel__","defaultLanguageCode":"en","currencyCode":"USD","pricesIncludeTax":false,"id":1,"defaultShippingZone":{"createdAt":"2021-10-15T08:12:29.625Z","updatedAt":"2021-10-15T08:12:29.625Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2021-10-15T08:12:29.625Z","updatedAt":"2021-10-15T08:12:29.625Z","name":"Europe","id":2}},"_session":{},"_languageCode":"en","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"ids":[35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66]}	COMPLETED	100	{"success":true,"indexedItemCount":32,"timeTaken":412}	\N	2021-10-15 15:13:27.301	2021-10-15 15:13:27.718	t	0	1	17
2021-10-15 15:12:33.010592	2021-10-15 15:12:34.434616	apply-collection-filters	{"ctx":{"_apiType":"admin","_channel":{"token":"qmp15bmbp0p5zc38dy8","createdAt":"2021-10-15T08:12:29.135Z","updatedAt":"2021-10-15T08:12:30.956Z","code":"__default_channel__","defaultLanguageCode":"en","currencyCode":"USD","pricesIncludeTax":false,"id":1,"defaultShippingZone":{"createdAt":"2021-10-15T08:12:29.625Z","updatedAt":"2021-10-15T08:12:29.625Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2021-10-15T08:12:29.625Z","updatedAt":"2021-10-15T08:12:29.625Z","name":"Europe","id":2}},"_languageCode":"en","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"collectionIds":[9]}	COMPLETED	100	\N	\N	2021-10-15 15:12:34.407	2021-10-15 15:12:34.433	t	0	1	9
2021-10-15 15:12:33.028731	2021-10-15 15:12:34.637653	apply-collection-filters	{"ctx":{"_apiType":"admin","_channel":{"token":"qmp15bmbp0p5zc38dy8","createdAt":"2021-10-15T08:12:29.135Z","updatedAt":"2021-10-15T08:12:30.956Z","code":"__default_channel__","defaultLanguageCode":"en","currencyCode":"USD","pricesIncludeTax":false,"id":1,"defaultShippingZone":{"createdAt":"2021-10-15T08:12:29.625Z","updatedAt":"2021-10-15T08:12:29.625Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2021-10-15T08:12:29.625Z","updatedAt":"2021-10-15T08:12:29.625Z","name":"Europe","id":2}},"_languageCode":"en","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"collectionIds":[10]}	COMPLETED	100	\N	\N	2021-10-15 15:12:34.618	2021-10-15 15:12:34.636	t	0	1	10
2021-10-15 15:12:33.864387	2021-10-15 15:12:35.106841	update-search-index	{"type":"update-variants-by-id","ctx":{"_apiType":"admin","_channel":{"token":"qmp15bmbp0p5zc38dy8","createdAt":"2021-10-15T08:12:29.135Z","updatedAt":"2021-10-15T08:12:30.956Z","code":"__default_channel__","defaultLanguageCode":"en","currencyCode":"USD","pricesIncludeTax":false,"id":1,"defaultShippingZone":{"createdAt":"2021-10-15T08:12:29.625Z","updatedAt":"2021-10-15T08:12:29.625Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2021-10-15T08:12:29.625Z","updatedAt":"2021-10-15T08:12:29.625Z","name":"Europe","id":2}},"_session":{},"_languageCode":"en","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"ids":[75,77,78,79,80,81,82,83,84,85,86,87,88]}	COMPLETED	100	{"success":true,"indexedItemCount":13,"timeTaken":99}	\N	2021-10-15 15:12:35.003	2021-10-15 15:12:35.105	t	0	1	15
2021-10-15 15:12:34.065239	2021-10-15 15:13:27.245869	update-search-index	{"type":"update-variants-by-id","ctx":{"_apiType":"admin","_channel":{"token":"qmp15bmbp0p5zc38dy8","createdAt":"2021-10-15T08:12:29.135Z","updatedAt":"2021-10-15T08:12:30.956Z","code":"__default_channel__","defaultLanguageCode":"en","currencyCode":"USD","pricesIncludeTax":false,"id":1,"defaultShippingZone":{"createdAt":"2021-10-15T08:12:29.625Z","updatedAt":"2021-10-15T08:12:29.625Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2021-10-15T08:12:29.625Z","updatedAt":"2021-10-15T08:12:29.625Z","name":"Europe","id":2}},"_session":{},"_languageCode":"en","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"ids":[67,68,69,70,71,72,73,74,76]}	COMPLETED	100	{"success":true,"indexedItemCount":9,"timeTaken":171}	\N	2021-10-15 15:13:27.06	2021-10-15 15:13:27.244	t	0	1	16
2021-10-15 15:12:34.484554	2021-10-15 15:13:27.846446	update-search-index	{"type":"update-variants-by-id","ctx":{"_apiType":"admin","_channel":{"token":"qmp15bmbp0p5zc38dy8","createdAt":"2021-10-15T08:12:29.135Z","updatedAt":"2021-10-15T08:12:30.956Z","code":"__default_channel__","defaultLanguageCode":"en","currencyCode":"USD","pricesIncludeTax":false,"id":1,"defaultShippingZone":{"createdAt":"2021-10-15T08:12:29.625Z","updatedAt":"2021-10-15T08:12:29.625Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2021-10-15T08:12:29.625Z","updatedAt":"2021-10-15T08:12:29.625Z","name":"Europe","id":2}},"_session":{},"_languageCode":"en","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"ids":[35,36,37,38,39,40,41,42]}	COMPLETED	100	{"success":true,"indexedItemCount":8,"timeTaken":100}	\N	2021-10-15 15:13:27.741	2021-10-15 15:13:27.845	t	0	1	18
2021-11-08 13:37:36.508276	2021-11-08 13:37:36.646209	apply-collection-filters	{"ctx":{"_apiType":"admin","_channel":{"token":"qmp15bmbp0p5zc38dy8","createdAt":"2021-10-15T08:12:29.135Z","updatedAt":"2021-11-08T06:37:34.690Z","code":"__default_channel__","defaultLanguageCode":"en","currencyCode":"USD","pricesIncludeTax":false,"id":1,"defaultShippingZone":{"createdAt":"2021-11-08T06:37:33.149Z","updatedAt":"2021-11-08T06:37:33.149Z","name":"Europe","id":7},"defaultTaxZone":{"createdAt":"2021-11-08T06:37:33.149Z","updatedAt":"2021-11-08T06:37:33.149Z","name":"Europe","id":7}},"_languageCode":"en","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"collectionIds":[11]}	COMPLETED	100	\N	\N	2021-11-08 13:37:36.598	2021-11-08 13:37:36.645	t	0	1	20
2021-10-15 15:12:34.690376	2021-10-15 15:13:28.243504	update-search-index	{"type":"update-variants-by-id","ctx":{"_apiType":"admin","_channel":{"token":"qmp15bmbp0p5zc38dy8","createdAt":"2021-10-15T08:12:29.135Z","updatedAt":"2021-10-15T08:12:30.956Z","code":"__default_channel__","defaultLanguageCode":"en","currencyCode":"USD","pricesIncludeTax":false,"id":1,"defaultShippingZone":{"createdAt":"2021-10-15T08:12:29.625Z","updatedAt":"2021-10-15T08:12:29.625Z","name":"Europe","id":2},"defaultTaxZone":{"createdAt":"2021-10-15T08:12:29.625Z","updatedAt":"2021-10-15T08:12:29.625Z","name":"Europe","id":2}},"_session":{},"_languageCode":"en","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"ids":[43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66]}	COMPLETED	100	{"success":true,"indexedItemCount":24,"timeTaken":272}	\N	2021-10-15 15:13:27.964	2021-10-15 15:13:28.242	t	0	1	19
2021-11-08 13:37:36.537968	2021-11-08 13:37:36.947099	apply-collection-filters	{"ctx":{"_apiType":"admin","_channel":{"token":"qmp15bmbp0p5zc38dy8","createdAt":"2021-10-15T08:12:29.135Z","updatedAt":"2021-11-08T06:37:34.690Z","code":"__default_channel__","defaultLanguageCode":"en","currencyCode":"USD","pricesIncludeTax":false,"id":1,"defaultShippingZone":{"createdAt":"2021-11-08T06:37:33.149Z","updatedAt":"2021-11-08T06:37:33.149Z","name":"Europe","id":7},"defaultTaxZone":{"createdAt":"2021-11-08T06:37:33.149Z","updatedAt":"2021-11-08T06:37:33.149Z","name":"Europe","id":7}},"_languageCode":"en","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"collectionIds":[12]}	COMPLETED	100	\N	\N	2021-11-08 13:37:36.923	2021-11-08 13:37:36.946	t	0	1	21
2021-11-08 13:37:36.561117	2021-11-08 13:37:37.184101	apply-collection-filters	{"ctx":{"_apiType":"admin","_channel":{"token":"qmp15bmbp0p5zc38dy8","createdAt":"2021-10-15T08:12:29.135Z","updatedAt":"2021-11-08T06:37:34.690Z","code":"__default_channel__","defaultLanguageCode":"en","currencyCode":"USD","pricesIncludeTax":false,"id":1,"defaultShippingZone":{"createdAt":"2021-11-08T06:37:33.149Z","updatedAt":"2021-11-08T06:37:33.149Z","name":"Europe","id":7},"defaultTaxZone":{"createdAt":"2021-11-08T06:37:33.149Z","updatedAt":"2021-11-08T06:37:33.149Z","name":"Europe","id":7}},"_languageCode":"en","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"collectionIds":[13]}	COMPLETED	100	\N	\N	2021-11-08 13:37:37.152	2021-11-08 13:37:37.183	t	0	1	22
2021-11-08 13:37:36.580883	2021-11-08 13:37:37.592863	apply-collection-filters	{"ctx":{"_apiType":"admin","_channel":{"token":"qmp15bmbp0p5zc38dy8","createdAt":"2021-10-15T08:12:29.135Z","updatedAt":"2021-11-08T06:37:34.690Z","code":"__default_channel__","defaultLanguageCode":"en","currencyCode":"USD","pricesIncludeTax":false,"id":1,"defaultShippingZone":{"createdAt":"2021-11-08T06:37:33.149Z","updatedAt":"2021-11-08T06:37:33.149Z","name":"Europe","id":7},"defaultTaxZone":{"createdAt":"2021-11-08T06:37:33.149Z","updatedAt":"2021-11-08T06:37:33.149Z","name":"Europe","id":7}},"_languageCode":"en","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"collectionIds":[14]}	COMPLETED	100	\N	\N	2021-11-08 13:37:37.572	2021-11-08 13:37:37.592	t	0	1	23
2021-11-08 13:37:36.606857	2021-11-08 13:37:37.828011	apply-collection-filters	{"ctx":{"_apiType":"admin","_channel":{"token":"qmp15bmbp0p5zc38dy8","createdAt":"2021-10-15T08:12:29.135Z","updatedAt":"2021-11-08T06:37:34.690Z","code":"__default_channel__","defaultLanguageCode":"en","currencyCode":"USD","pricesIncludeTax":false,"id":1,"defaultShippingZone":{"createdAt":"2021-11-08T06:37:33.149Z","updatedAt":"2021-11-08T06:37:33.149Z","name":"Europe","id":7},"defaultTaxZone":{"createdAt":"2021-11-08T06:37:33.149Z","updatedAt":"2021-11-08T06:37:33.149Z","name":"Europe","id":7}},"_languageCode":"en","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"collectionIds":[15]}	COMPLETED	100	\N	\N	2021-11-08 13:37:37.798	2021-11-08 13:37:37.827	t	0	1	24
2021-11-08 13:37:36.659846	2021-11-08 13:37:38.264952	apply-collection-filters	{"ctx":{"_apiType":"admin","_channel":{"token":"qmp15bmbp0p5zc38dy8","createdAt":"2021-10-15T08:12:29.135Z","updatedAt":"2021-11-08T06:37:34.690Z","code":"__default_channel__","defaultLanguageCode":"en","currencyCode":"USD","pricesIncludeTax":false,"id":1,"defaultShippingZone":{"createdAt":"2021-11-08T06:37:33.149Z","updatedAt":"2021-11-08T06:37:33.149Z","name":"Europe","id":7},"defaultTaxZone":{"createdAt":"2021-11-08T06:37:33.149Z","updatedAt":"2021-11-08T06:37:33.149Z","name":"Europe","id":7}},"_languageCode":"en","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"collectionIds":[17]}	COMPLETED	100	\N	\N	2021-11-08 13:37:38.238	2021-11-08 13:37:38.264	t	0	1	26
2021-11-08 13:37:36.680743	2021-11-08 13:37:38.527968	apply-collection-filters	{"ctx":{"_apiType":"admin","_channel":{"token":"qmp15bmbp0p5zc38dy8","createdAt":"2021-10-15T08:12:29.135Z","updatedAt":"2021-11-08T06:37:34.690Z","code":"__default_channel__","defaultLanguageCode":"en","currencyCode":"USD","pricesIncludeTax":false,"id":1,"defaultShippingZone":{"createdAt":"2021-11-08T06:37:33.149Z","updatedAt":"2021-11-08T06:37:33.149Z","name":"Europe","id":7},"defaultTaxZone":{"createdAt":"2021-11-08T06:37:33.149Z","updatedAt":"2021-11-08T06:37:33.149Z","name":"Europe","id":7}},"_languageCode":"en","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"collectionIds":[18]}	COMPLETED	100	\N	\N	2021-11-08 13:37:38.481	2021-11-08 13:37:38.527	t	0	1	27
2021-11-08 13:37:36.695155	2021-11-08 13:37:37.084596	update-search-index	{"type":"update-variants-by-id","ctx":{"_apiType":"admin","_channel":{"token":"qmp15bmbp0p5zc38dy8","createdAt":"2021-10-15T08:12:29.135Z","updatedAt":"2021-11-08T06:37:34.690Z","code":"__default_channel__","defaultLanguageCode":"en","currencyCode":"USD","pricesIncludeTax":false,"id":1,"defaultShippingZone":{"createdAt":"2021-11-08T06:37:33.149Z","updatedAt":"2021-11-08T06:37:33.149Z","name":"Europe","id":7},"defaultTaxZone":{"createdAt":"2021-11-08T06:37:33.149Z","updatedAt":"2021-11-08T06:37:33.149Z","name":"Europe","id":7}},"_session":{},"_languageCode":"en","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"ids":[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122]}	COMPLETED	100	{"success":true,"indexedItemCount":68,"timeTaken":321}	\N	2021-11-08 13:37:36.74	2021-11-08 13:37:37.083	t	0	1	28
2021-11-08 13:37:36.787732	2021-11-08 13:37:37.797739	update-search-index	{"type":"reindex","ctx":{"_apiType":"admin","_channel":{"token":"qmp15bmbp0p5zc38dy8","createdAt":"2021-10-15T08:12:29.135Z","updatedAt":"2021-11-08T06:37:34.690Z","code":"__default_channel__","defaultLanguageCode":"en","currencyCode":"USD","pricesIncludeTax":false,"id":1,"defaultShippingZone":{"createdAt":"2021-11-08T06:37:33.149Z","updatedAt":"2021-11-08T06:37:33.149Z","name":"Europe","id":7},"defaultTaxZone":{"createdAt":"2021-11-08T06:37:33.149Z","updatedAt":"2021-11-08T06:37:33.149Z","name":"Europe","id":7}},"_languageCode":"en","_isAuthorized":true,"_authorizedAsOwnerOnly":false}}	COMPLETED	100	{"success":true,"indexedItemCount":176,"timeTaken":593}	\N	2021-11-08 13:37:37.19	2021-11-08 13:37:37.796	t	0	1	30
2021-11-08 13:37:36.996972	2021-11-08 13:37:38.019216	update-search-index	{"type":"update-variants-by-id","ctx":{"_apiType":"admin","_channel":{"token":"qmp15bmbp0p5zc38dy8","createdAt":"2021-10-15T08:12:29.135Z","updatedAt":"2021-11-08T06:37:34.690Z","code":"__default_channel__","defaultLanguageCode":"en","currencyCode":"USD","pricesIncludeTax":false,"id":1,"defaultShippingZone":{"createdAt":"2021-11-08T06:37:33.149Z","updatedAt":"2021-11-08T06:37:33.149Z","name":"Europe","id":7},"defaultTaxZone":{"createdAt":"2021-11-08T06:37:33.149Z","updatedAt":"2021-11-08T06:37:33.149Z","name":"Europe","id":7}},"_session":{},"_languageCode":"en","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"ids":[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113]}	COMPLETED	100	{"success":true,"indexedItemCount":50,"timeTaken":186}	\N	2021-11-08 13:37:37.829	2021-11-08 13:37:38.018	t	0	1	31
2021-11-08 13:37:37.642926	2021-11-08 13:37:38.640469	update-search-index	{"type":"update-variants-by-id","ctx":{"_apiType":"admin","_channel":{"token":"qmp15bmbp0p5zc38dy8","createdAt":"2021-10-15T08:12:29.135Z","updatedAt":"2021-11-08T06:37:34.690Z","code":"__default_channel__","defaultLanguageCode":"en","currencyCode":"USD","pricesIncludeTax":false,"id":1,"defaultShippingZone":{"createdAt":"2021-11-08T06:37:33.149Z","updatedAt":"2021-11-08T06:37:33.149Z","name":"Europe","id":7},"defaultTaxZone":{"createdAt":"2021-11-08T06:37:33.149Z","updatedAt":"2021-11-08T06:37:33.149Z","name":"Europe","id":7}},"_session":{},"_languageCode":"en","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"ids":[67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176]}	COMPLETED	100	{"success":true,"indexedItemCount":44,"timeTaken":336}	\N	2021-11-08 13:37:38.299	2021-11-08 13:37:38.639	t	0	1	33
2021-11-08 13:37:36.635094	2021-11-08 13:37:38.043844	apply-collection-filters	{"ctx":{"_apiType":"admin","_channel":{"token":"qmp15bmbp0p5zc38dy8","createdAt":"2021-10-15T08:12:29.135Z","updatedAt":"2021-11-08T06:37:34.690Z","code":"__default_channel__","defaultLanguageCode":"en","currencyCode":"USD","pricesIncludeTax":false,"id":1,"defaultShippingZone":{"createdAt":"2021-11-08T06:37:33.149Z","updatedAt":"2021-11-08T06:37:33.149Z","name":"Europe","id":7},"defaultTaxZone":{"createdAt":"2021-11-08T06:37:33.149Z","updatedAt":"2021-11-08T06:37:33.149Z","name":"Europe","id":7}},"_languageCode":"en","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"collectionIds":[16]}	COMPLETED	100	\N	\N	2021-11-08 13:37:38.025	2021-11-08 13:37:38.043	t	0	1	25
2021-11-08 13:37:38.093779	2021-11-08 13:37:38.093779	update-search-index	{"type":"update-variants-by-id","ctx":{"_apiType":"admin","_channel":{"token":"qmp15bmbp0p5zc38dy8","createdAt":"2021-10-15T08:12:29.135Z","updatedAt":"2021-11-08T06:37:34.690Z","code":"__default_channel__","defaultLanguageCode":"en","currencyCode":"USD","pricesIncludeTax":false,"id":1,"defaultShippingZone":{"createdAt":"2021-11-08T06:37:33.149Z","updatedAt":"2021-11-08T06:37:33.149Z","name":"Europe","id":7},"defaultTaxZone":{"createdAt":"2021-11-08T06:37:33.149Z","updatedAt":"2021-11-08T06:37:33.149Z","name":"Europe","id":7}},"_session":{},"_languageCode":"en","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"ids":[67,68,69,70,71,72,73,74,76,155,156,157,158,159,160,161,162,164]}	PENDING	0	\N	\N	\N	\N	f	0	0	35
2021-11-08 13:37:36.700175	2021-11-08 13:37:38.743633	apply-collection-filters	{"ctx":{"_apiType":"admin","_channel":{"token":"qmp15bmbp0p5zc38dy8","createdAt":"2021-10-15T08:12:29.135Z","updatedAt":"2021-11-08T06:37:34.690Z","code":"__default_channel__","defaultLanguageCode":"en","currencyCode":"USD","pricesIncludeTax":false,"id":1,"defaultShippingZone":{"createdAt":"2021-11-08T06:37:33.149Z","updatedAt":"2021-11-08T06:37:33.149Z","name":"Europe","id":7},"defaultTaxZone":{"createdAt":"2021-11-08T06:37:33.149Z","updatedAt":"2021-11-08T06:37:33.149Z","name":"Europe","id":7}},"_languageCode":"en","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"collectionIds":[19]}	COMPLETED	100	\N	\N	2021-11-08 13:37:38.705	2021-11-08 13:37:38.743	t	0	1	29
2021-11-08 13:37:37.236509	2021-11-08 13:37:38.178189	update-search-index	{"type":"update-variants-by-id","ctx":{"_apiType":"admin","_channel":{"token":"qmp15bmbp0p5zc38dy8","createdAt":"2021-10-15T08:12:29.135Z","updatedAt":"2021-11-08T06:37:34.690Z","code":"__default_channel__","defaultLanguageCode":"en","currencyCode":"USD","pricesIncludeTax":false,"id":1,"defaultShippingZone":{"createdAt":"2021-11-08T06:37:33.149Z","updatedAt":"2021-11-08T06:37:33.149Z","name":"Europe","id":7},"defaultTaxZone":{"createdAt":"2021-11-08T06:37:33.149Z","updatedAt":"2021-11-08T06:37:33.149Z","name":"Europe","id":7}},"_session":{},"_languageCode":"en","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"ids":[26,27,28,29,30,31,32,33,34,114,115,116,117,118,119,120,121,122]}	COMPLETED	100	{"success":true,"indexedItemCount":18,"timeTaken":111}	\N	2021-11-08 13:37:38.056	2021-11-08 13:37:38.176	t	0	1	32
2021-11-08 13:37:38.579519	2021-11-08 13:37:38.579519	update-search-index	{"type":"update-variants-by-id","ctx":{"_apiType":"admin","_channel":{"token":"qmp15bmbp0p5zc38dy8","createdAt":"2021-10-15T08:12:29.135Z","updatedAt":"2021-11-08T06:37:34.690Z","code":"__default_channel__","defaultLanguageCode":"en","currencyCode":"USD","pricesIncludeTax":false,"id":1,"defaultShippingZone":{"createdAt":"2021-11-08T06:37:33.149Z","updatedAt":"2021-11-08T06:37:33.149Z","name":"Europe","id":7},"defaultTaxZone":{"createdAt":"2021-11-08T06:37:33.149Z","updatedAt":"2021-11-08T06:37:33.149Z","name":"Europe","id":7}},"_session":{},"_languageCode":"en","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"ids":[35,36,37,38,39,40,41,42,123,124,125,126,127,128,129,130]}	PENDING	0	\N	\N	\N	\N	f	0	0	37
2021-11-08 13:37:37.96095	2021-11-08 13:37:38.8131	update-search-index	{"type":"update-variants-by-id","ctx":{"_apiType":"admin","_channel":{"token":"qmp15bmbp0p5zc38dy8","createdAt":"2021-10-15T08:12:29.135Z","updatedAt":"2021-11-08T06:37:34.690Z","code":"__default_channel__","defaultLanguageCode":"en","currencyCode":"USD","pricesIncludeTax":false,"id":1,"defaultShippingZone":{"createdAt":"2021-11-08T06:37:33.149Z","updatedAt":"2021-11-08T06:37:33.149Z","name":"Europe","id":7},"defaultTaxZone":{"createdAt":"2021-11-08T06:37:33.149Z","updatedAt":"2021-11-08T06:37:33.149Z","name":"Europe","id":7}},"_session":{},"_languageCode":"en","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"ids":[75,77,78,79,80,81,82,83,84,85,86,87,88,163,165,166,167,168,169,170,171,172,173,174,175,176]}	PENDING	0	\N	\N	2021-11-08 13:37:38.717	\N	f	0	0	34
2021-11-08 13:37:38.314984	2021-11-08 13:37:38.314984	update-search-index	{"type":"update-variants-by-id","ctx":{"_apiType":"admin","_channel":{"token":"qmp15bmbp0p5zc38dy8","createdAt":"2021-10-15T08:12:29.135Z","updatedAt":"2021-11-08T06:37:34.690Z","code":"__default_channel__","defaultLanguageCode":"en","currencyCode":"USD","pricesIncludeTax":false,"id":1,"defaultShippingZone":{"createdAt":"2021-11-08T06:37:33.149Z","updatedAt":"2021-11-08T06:37:33.149Z","name":"Europe","id":7},"defaultTaxZone":{"createdAt":"2021-11-08T06:37:33.149Z","updatedAt":"2021-11-08T06:37:33.149Z","name":"Europe","id":7}},"_session":{},"_languageCode":"en","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"ids":[35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154]}	PENDING	0	\N	\N	\N	\N	f	0	0	36
2021-11-08 13:37:38.812989	2021-11-08 13:37:38.812989	update-search-index	{"type":"update-variants-by-id","ctx":{"_apiType":"admin","_channel":{"token":"qmp15bmbp0p5zc38dy8","createdAt":"2021-10-15T08:12:29.135Z","updatedAt":"2021-11-08T06:37:34.690Z","code":"__default_channel__","defaultLanguageCode":"en","currencyCode":"USD","pricesIncludeTax":false,"id":1,"defaultShippingZone":{"createdAt":"2021-11-08T06:37:33.149Z","updatedAt":"2021-11-08T06:37:33.149Z","name":"Europe","id":7},"defaultTaxZone":{"createdAt":"2021-11-08T06:37:33.149Z","updatedAt":"2021-11-08T06:37:33.149Z","name":"Europe","id":7}},"_session":{},"_languageCode":"en","_isAuthorized":true,"_authorizedAsOwnerOnly":false},"ids":[43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154]}	PENDING	0	\N	\N	\N	\N	f	0	0	38
\.


--
-- Data for Name: job_record_buffer; Type: TABLE DATA; Schema: public; Owner: ghienan
--

COPY public.job_record_buffer ("createdAt", "updatedAt", "bufferId", job, id) FROM stdin;
\.


--
-- Data for Name: order; Type: TABLE DATA; Schema: public; Owner: ghienan
--

COPY public."order" ("createdAt", "updatedAt", code, state, active, "orderPlacedAt", "couponCodes", "shippingAddress", "billingAddress", "currencyCode", "subTotal", "subTotalWithTax", shipping, "shippingWithTax", id, "taxZoneId", "customerId") FROM stdin;
\.


--
-- Data for Name: order_channels_channel; Type: TABLE DATA; Schema: public; Owner: ghienan
--

COPY public.order_channels_channel ("orderId", "channelId") FROM stdin;
\.


--
-- Data for Name: order_item; Type: TABLE DATA; Schema: public; Owner: ghienan
--

COPY public.order_item ("createdAt", "updatedAt", "initialListPrice", "listPrice", "listPriceIncludesTax", adjustments, "taxLines", cancelled, id, "lineId", "refundId") FROM stdin;
\.


--
-- Data for Name: order_item_fulfillments_fulfillment; Type: TABLE DATA; Schema: public; Owner: ghienan
--

COPY public.order_item_fulfillments_fulfillment ("orderItemId", "fulfillmentId") FROM stdin;
\.


--
-- Data for Name: order_line; Type: TABLE DATA; Schema: public; Owner: ghienan
--

COPY public.order_line ("createdAt", "updatedAt", id, "productVariantId", "taxCategoryId", "featuredAssetId", "orderId") FROM stdin;
\.


--
-- Data for Name: order_modification; Type: TABLE DATA; Schema: public; Owner: ghienan
--

COPY public.order_modification ("createdAt", "updatedAt", note, "priceChange", "shippingAddressChange", "billingAddressChange", id, "orderId", "paymentId", "refundId") FROM stdin;
\.


--
-- Data for Name: order_modification_order_items_order_item; Type: TABLE DATA; Schema: public; Owner: ghienan
--

COPY public.order_modification_order_items_order_item ("orderModificationId", "orderItemId") FROM stdin;
\.


--
-- Data for Name: order_promotions_promotion; Type: TABLE DATA; Schema: public; Owner: ghienan
--

COPY public.order_promotions_promotion ("orderId", "promotionId") FROM stdin;
\.


--
-- Data for Name: payment; Type: TABLE DATA; Schema: public; Owner: ghienan
--

COPY public.payment ("createdAt", "updatedAt", method, amount, state, "errorMessage", "transactionId", metadata, id, "orderId") FROM stdin;
\.


--
-- Data for Name: payment_method; Type: TABLE DATA; Schema: public; Owner: ghienan
--

COPY public.payment_method ("createdAt", "updatedAt", name, code, description, enabled, checker, handler, id) FROM stdin;
2021-10-15 15:12:30.947122	2021-10-15 15:12:30.947122	Standard Payment	standard-payment		t	\N	{"code":"dummy-payment-handler","args":[{"name":"automaticSettle","value":"false"}]}	1
2021-11-08 13:37:34.675291	2021-11-08 13:37:34.675291	Standard Payment	standard-payment		t	\N	{"code":"dummy-payment-handler","args":[{"name":"automaticSettle","value":"false"}]}	2
\.


--
-- Data for Name: payment_method_channels_channel; Type: TABLE DATA; Schema: public; Owner: ghienan
--

COPY public.payment_method_channels_channel ("paymentMethodId", "channelId") FROM stdin;
1	1
2	1
\.


--
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: ghienan
--

COPY public.product ("createdAt", "updatedAt", "deletedAt", enabled, id, "featuredAssetId") FROM stdin;
2021-10-15 15:12:31.109483	2021-10-15 15:12:31.109483	\N	t	1	1
2021-10-15 15:12:31.197902	2021-10-15 15:12:31.197902	\N	t	2	2
2021-10-15 15:12:31.240625	2021-10-15 15:12:31.240625	\N	t	3	3
2021-10-15 15:12:31.264845	2021-10-15 15:12:31.264845	\N	t	4	4
2021-10-15 15:12:31.281925	2021-10-15 15:12:31.281925	\N	t	5	5
2021-10-15 15:12:31.324635	2021-10-15 15:12:31.324635	\N	t	6	6
2021-10-15 15:12:31.372985	2021-10-15 15:12:31.372985	\N	t	7	7
2021-10-15 15:12:31.440801	2021-10-15 15:12:31.440801	\N	t	8	8
2021-10-15 15:12:31.503546	2021-10-15 15:12:31.503546	\N	t	9	9
2021-10-15 15:12:31.519742	2021-10-15 15:12:31.519742	\N	t	10	10
2021-10-15 15:12:31.535932	2021-10-15 15:12:31.535932	\N	t	11	11
2021-10-15 15:12:31.56045	2021-10-15 15:12:31.56045	\N	t	12	12
2021-10-15 15:12:31.584549	2021-10-15 15:12:31.584549	\N	t	13	13
2021-10-15 15:12:31.60712	2021-10-15 15:12:31.60712	\N	t	14	14
2021-10-15 15:12:31.62741	2021-10-15 15:12:31.62741	\N	t	15	15
2021-10-15 15:12:31.648731	2021-10-15 15:12:31.648731	\N	t	16	16
2021-10-15 15:12:31.671349	2021-10-15 15:12:31.671349	\N	t	17	17
2021-10-15 15:12:31.689125	2021-10-15 15:12:31.689125	\N	t	18	18
2021-10-15 15:12:31.705463	2021-10-15 15:12:31.705463	\N	t	19	19
2021-10-15 15:12:31.726162	2021-10-15 15:12:31.726162	\N	t	20	20
2021-10-15 15:12:31.758267	2021-10-15 15:12:31.758267	\N	t	21	21
2021-10-15 15:12:31.780925	2021-10-15 15:12:31.780925	\N	t	22	22
2021-10-15 15:12:31.797845	2021-10-15 15:12:31.797845	\N	t	23	23
2021-10-15 15:12:31.815986	2021-10-15 15:12:31.815986	\N	t	24	24
2021-10-15 15:12:31.838066	2021-10-15 15:12:31.838066	\N	t	25	25
2021-10-15 15:12:31.873551	2021-10-15 15:12:31.873551	\N	t	26	26
2021-10-15 15:12:31.896904	2021-10-15 15:12:31.896904	\N	t	27	27
2021-10-15 15:12:31.914227	2021-10-15 15:12:31.914227	\N	t	28	28
2021-10-15 15:12:31.961197	2021-10-15 15:12:31.961197	\N	t	29	29
2021-10-15 15:12:32.024028	2021-10-15 15:12:32.024028	\N	t	30	30
2021-10-15 15:12:32.082402	2021-10-15 15:12:32.082402	\N	t	31	31
2021-10-15 15:12:32.136	2021-10-15 15:12:32.136	\N	t	32	32
2021-10-15 15:12:32.186071	2021-10-15 15:12:32.186071	\N	t	33	33
2021-10-15 15:12:32.248687	2021-10-15 15:12:32.248687	\N	t	34	34
2021-10-15 15:12:32.35398	2021-10-15 15:12:32.35398	\N	t	35	35
2021-10-15 15:12:32.379178	2021-10-15 15:12:32.379178	\N	t	36	36
2021-10-15 15:12:32.396469	2021-10-15 15:12:32.396469	\N	t	37	37
2021-10-15 15:12:32.41376	2021-10-15 15:12:32.41376	\N	t	38	38
2021-10-15 15:12:32.429117	2021-10-15 15:12:32.429117	\N	t	39	39
2021-10-15 15:12:32.447004	2021-10-15 15:12:32.447004	\N	t	40	40
2021-10-15 15:12:32.46169	2021-10-15 15:12:32.46169	\N	t	41	41
2021-10-15 15:12:32.476765	2021-10-15 15:12:32.476765	\N	t	42	42
2021-10-15 15:12:32.505164	2021-10-15 15:12:32.505164	\N	t	43	43
2021-10-15 15:12:32.540822	2021-10-15 15:12:32.540822	\N	t	44	44
2021-10-15 15:12:32.58523	2021-10-15 15:12:32.58523	\N	t	45	45
2021-10-15 15:12:32.607042	2021-10-15 15:12:32.607042	\N	t	46	46
2021-10-15 15:12:32.629292	2021-10-15 15:12:32.629292	\N	t	47	47
2021-10-15 15:12:32.647851	2021-10-15 15:12:32.647851	\N	t	48	48
2021-10-15 15:12:32.670762	2021-10-15 15:12:32.670762	\N	t	49	49
2021-10-15 15:12:32.689475	2021-10-15 15:12:32.689475	\N	t	50	50
2021-10-15 15:12:32.709383	2021-10-15 15:12:32.709383	\N	t	51	51
2021-10-15 15:12:32.726614	2021-10-15 15:12:32.726614	\N	t	52	52
2021-10-15 15:12:32.744954	2021-10-15 15:12:32.744954	\N	t	53	53
2021-10-15 15:12:32.76174	2021-10-15 15:12:32.76174	\N	t	54	54
2021-11-08 13:37:34.836264	2021-11-08 13:37:34.836264	\N	t	55	55
2021-11-08 13:37:34.976645	2021-11-08 13:37:34.976645	\N	t	56	56
2021-11-08 13:37:35.01961	2021-11-08 13:37:35.01961	\N	t	57	57
2021-11-08 13:37:35.041913	2021-11-08 13:37:35.041913	\N	t	58	58
2021-11-08 13:37:35.061868	2021-11-08 13:37:35.061868	\N	t	59	59
2021-11-08 13:37:35.111549	2021-11-08 13:37:35.111549	\N	t	60	60
2021-11-08 13:37:35.159649	2021-11-08 13:37:35.159649	\N	t	61	61
2021-11-08 13:37:35.235253	2021-11-08 13:37:35.235253	\N	t	62	62
2021-11-08 13:37:35.308662	2021-11-08 13:37:35.308662	\N	t	63	63
2021-11-08 13:37:35.329724	2021-11-08 13:37:35.329724	\N	t	64	64
2021-11-08 13:37:35.34758	2021-11-08 13:37:35.34758	\N	t	65	65
2021-11-08 13:37:35.367214	2021-11-08 13:37:35.367214	\N	t	66	66
2021-11-08 13:37:35.385742	2021-11-08 13:37:35.385742	\N	t	67	67
2021-11-08 13:37:35.408117	2021-11-08 13:37:35.408117	\N	t	68	68
2021-11-08 13:37:35.424412	2021-11-08 13:37:35.424412	\N	t	69	69
2021-11-08 13:37:35.442867	2021-11-08 13:37:35.442867	\N	t	70	70
2021-11-08 13:37:35.463011	2021-11-08 13:37:35.463011	\N	t	71	71
2021-11-08 13:37:35.487745	2021-11-08 13:37:35.487745	\N	t	72	72
2021-11-08 13:37:35.504617	2021-11-08 13:37:35.504617	\N	t	73	73
2021-11-08 13:37:35.522304	2021-11-08 13:37:35.522304	\N	t	74	74
2021-11-08 13:37:35.538635	2021-11-08 13:37:35.538635	\N	t	75	75
2021-11-08 13:37:35.558623	2021-11-08 13:37:35.558623	\N	t	76	76
2021-11-08 13:37:35.574799	2021-11-08 13:37:35.574799	\N	t	77	77
2021-11-08 13:37:35.59314	2021-11-08 13:37:35.59314	\N	t	78	78
2021-11-08 13:37:35.612377	2021-11-08 13:37:35.612377	\N	t	79	79
2021-11-08 13:37:35.628151	2021-11-08 13:37:35.628151	\N	t	80	80
2021-11-08 13:37:35.642659	2021-11-08 13:37:35.642659	\N	t	81	81
2021-11-08 13:37:35.657474	2021-11-08 13:37:35.657474	\N	t	82	82
2021-11-08 13:37:35.679292	2021-11-08 13:37:35.679292	\N	t	83	83
2021-11-08 13:37:35.732316	2021-11-08 13:37:35.732316	\N	t	84	84
2021-11-08 13:37:35.807412	2021-11-08 13:37:35.807412	\N	t	85	85
2021-11-08 13:37:35.880289	2021-11-08 13:37:35.880289	\N	t	86	86
2021-11-08 13:37:35.934385	2021-11-08 13:37:35.934385	\N	t	87	87
2021-11-08 13:37:35.988147	2021-11-08 13:37:35.988147	\N	t	88	88
2021-11-08 13:37:36.077864	2021-11-08 13:37:36.077864	\N	t	89	89
2021-11-08 13:37:36.100445	2021-11-08 13:37:36.100445	\N	t	90	90
2021-11-08 13:37:36.120224	2021-11-08 13:37:36.120224	\N	t	91	91
2021-11-08 13:37:36.137985	2021-11-08 13:37:36.137985	\N	t	92	92
2021-11-08 13:37:36.154727	2021-11-08 13:37:36.154727	\N	t	93	93
2021-11-08 13:37:36.171674	2021-11-08 13:37:36.171674	\N	t	94	94
2021-11-08 13:37:36.19303	2021-11-08 13:37:36.19303	\N	t	95	95
2021-11-08 13:37:36.210987	2021-11-08 13:37:36.210987	\N	t	96	96
2021-11-08 13:37:36.229121	2021-11-08 13:37:36.229121	\N	t	97	97
2021-11-08 13:37:36.25495	2021-11-08 13:37:36.25495	\N	t	98	98
2021-11-08 13:37:36.274577	2021-11-08 13:37:36.274577	\N	t	99	99
2021-11-08 13:37:36.292254	2021-11-08 13:37:36.292254	\N	t	100	100
2021-11-08 13:37:36.308465	2021-11-08 13:37:36.308465	\N	t	101	101
2021-11-08 13:37:36.325573	2021-11-08 13:37:36.325573	\N	t	102	102
2021-11-08 13:37:36.341096	2021-11-08 13:37:36.341096	\N	t	103	103
2021-11-08 13:37:36.357738	2021-11-08 13:37:36.357738	\N	t	104	104
2021-11-08 13:37:36.374406	2021-11-08 13:37:36.374406	\N	t	105	105
2021-11-08 13:37:36.389759	2021-11-08 13:37:36.389759	\N	t	106	106
2021-11-08 13:37:36.405255	2021-11-08 13:37:36.405255	\N	t	107	107
2021-11-08 13:37:36.421491	2021-11-08 13:37:36.421491	\N	t	108	108
\.


--
-- Data for Name: product_asset; Type: TABLE DATA; Schema: public; Owner: ghienan
--

COPY public.product_asset ("createdAt", "updatedAt", "assetId", "position", "productId", id) FROM stdin;
2021-10-15 15:12:31.119894	2021-10-15 15:12:31.119894	1	0	1	1
2021-10-15 15:12:31.200746	2021-10-15 15:12:31.200746	2	0	2	2
2021-10-15 15:12:31.243616	2021-10-15 15:12:31.243616	3	0	3	3
2021-10-15 15:12:31.267655	2021-10-15 15:12:31.267655	4	0	4	4
2021-10-15 15:12:31.28498	2021-10-15 15:12:31.28498	5	0	5	5
2021-10-15 15:12:31.327124	2021-10-15 15:12:31.327124	6	0	6	6
2021-10-15 15:12:31.376576	2021-10-15 15:12:31.376576	7	0	7	7
2021-10-15 15:12:31.444209	2021-10-15 15:12:31.444209	8	0	8	8
2021-10-15 15:12:31.505944	2021-10-15 15:12:31.505944	9	0	9	9
2021-10-15 15:12:31.521898	2021-10-15 15:12:31.521898	10	0	10	10
2021-10-15 15:12:31.538247	2021-10-15 15:12:31.538247	11	0	11	11
2021-10-15 15:12:31.562855	2021-10-15 15:12:31.562855	12	0	12	12
2021-10-15 15:12:31.588878	2021-10-15 15:12:31.588878	13	0	13	13
2021-10-15 15:12:31.609357	2021-10-15 15:12:31.609357	14	0	14	14
2021-10-15 15:12:31.629793	2021-10-15 15:12:31.629793	15	0	15	15
2021-10-15 15:12:31.6512	2021-10-15 15:12:31.6512	16	0	16	16
2021-10-15 15:12:31.673559	2021-10-15 15:12:31.673559	17	0	17	17
2021-10-15 15:12:31.691528	2021-10-15 15:12:31.691528	18	0	18	18
2021-10-15 15:12:31.708902	2021-10-15 15:12:31.708902	19	0	19	19
2021-10-15 15:12:31.72837	2021-10-15 15:12:31.72837	20	0	20	20
2021-10-15 15:12:31.760764	2021-10-15 15:12:31.760764	21	0	21	21
2021-10-15 15:12:31.78344	2021-10-15 15:12:31.78344	22	0	22	22
2021-10-15 15:12:31.800741	2021-10-15 15:12:31.800741	23	0	23	23
2021-10-15 15:12:31.818303	2021-10-15 15:12:31.818303	24	0	24	24
2021-10-15 15:12:31.844094	2021-10-15 15:12:31.844094	25	0	25	25
2021-10-15 15:12:31.876167	2021-10-15 15:12:31.876167	26	0	26	26
2021-10-15 15:12:31.899573	2021-10-15 15:12:31.899573	27	0	27	27
2021-10-15 15:12:31.916749	2021-10-15 15:12:31.916749	28	0	28	28
2021-10-15 15:12:31.964191	2021-10-15 15:12:31.964191	29	0	29	29
2021-10-15 15:12:32.026463	2021-10-15 15:12:32.026463	30	0	30	30
2021-10-15 15:12:32.085461	2021-10-15 15:12:32.085461	31	0	31	31
2021-10-15 15:12:32.138291	2021-10-15 15:12:32.138291	32	0	32	32
2021-10-15 15:12:32.18834	2021-10-15 15:12:32.18834	33	0	33	33
2021-10-15 15:12:32.255056	2021-10-15 15:12:32.255056	34	0	34	34
2021-10-15 15:12:32.357804	2021-10-15 15:12:32.357804	35	0	35	35
2021-10-15 15:12:32.382044	2021-10-15 15:12:32.382044	36	0	36	36
2021-10-15 15:12:32.399211	2021-10-15 15:12:32.399211	37	0	37	37
2021-10-15 15:12:32.416493	2021-10-15 15:12:32.416493	38	0	38	38
2021-10-15 15:12:32.432362	2021-10-15 15:12:32.432362	39	0	39	39
2021-10-15 15:12:32.44949	2021-10-15 15:12:32.44949	40	0	40	40
2021-10-15 15:12:32.464266	2021-10-15 15:12:32.464266	41	0	41	41
2021-10-15 15:12:32.478839	2021-10-15 15:12:32.478839	42	0	42	42
2021-10-15 15:12:32.508186	2021-10-15 15:12:32.508186	43	0	43	43
2021-10-15 15:12:32.543621	2021-10-15 15:12:32.543621	44	0	44	44
2021-10-15 15:12:32.590119	2021-10-15 15:12:32.590119	45	0	45	45
2021-10-15 15:12:32.60928	2021-10-15 15:12:32.60928	46	0	46	46
2021-10-15 15:12:32.63251	2021-10-15 15:12:32.63251	47	0	47	47
2021-10-15 15:12:32.650115	2021-10-15 15:12:32.650115	48	0	48	48
2021-10-15 15:12:32.673418	2021-10-15 15:12:32.673418	49	0	49	49
2021-10-15 15:12:32.693479	2021-10-15 15:12:32.693479	50	0	50	50
2021-10-15 15:12:32.711722	2021-10-15 15:12:32.711722	51	0	51	51
2021-10-15 15:12:32.728825	2021-10-15 15:12:32.728825	52	0	52	52
2021-10-15 15:12:32.747508	2021-10-15 15:12:32.747508	53	0	53	53
2021-10-15 15:12:32.764419	2021-10-15 15:12:32.764419	54	0	54	54
2021-11-08 13:37:34.857255	2021-11-08 13:37:34.857255	55	0	55	55
2021-11-08 13:37:34.97968	2021-11-08 13:37:34.97968	56	0	56	56
2021-11-08 13:37:35.02415	2021-11-08 13:37:35.02415	57	0	57	57
2021-11-08 13:37:35.044573	2021-11-08 13:37:35.044573	58	0	58	58
2021-11-08 13:37:35.065198	2021-11-08 13:37:35.065198	59	0	59	59
2021-11-08 13:37:35.114931	2021-11-08 13:37:35.114931	60	0	60	60
2021-11-08 13:37:35.16209	2021-11-08 13:37:35.16209	61	0	61	61
2021-11-08 13:37:35.241148	2021-11-08 13:37:35.241148	62	0	62	62
2021-11-08 13:37:35.311557	2021-11-08 13:37:35.311557	63	0	63	63
2021-11-08 13:37:35.332616	2021-11-08 13:37:35.332616	64	0	64	64
2021-11-08 13:37:35.350633	2021-11-08 13:37:35.350633	65	0	65	65
2021-11-08 13:37:35.370688	2021-11-08 13:37:35.370688	66	0	66	66
2021-11-08 13:37:35.390865	2021-11-08 13:37:35.390865	67	0	67	67
2021-11-08 13:37:35.410471	2021-11-08 13:37:35.410471	68	0	68	68
2021-11-08 13:37:35.426825	2021-11-08 13:37:35.426825	69	0	69	69
2021-11-08 13:37:35.44541	2021-11-08 13:37:35.44541	70	0	70	70
2021-11-08 13:37:35.467839	2021-11-08 13:37:35.467839	71	0	71	71
2021-11-08 13:37:35.490446	2021-11-08 13:37:35.490446	72	0	72	72
2021-11-08 13:37:35.507575	2021-11-08 13:37:35.507575	73	0	73	73
2021-11-08 13:37:35.524703	2021-11-08 13:37:35.524703	74	0	74	74
2021-11-08 13:37:35.542343	2021-11-08 13:37:35.542343	75	0	75	75
2021-11-08 13:37:35.560937	2021-11-08 13:37:35.560937	76	0	76	76
2021-11-08 13:37:35.577127	2021-11-08 13:37:35.577127	77	0	77	77
2021-11-08 13:37:35.597237	2021-11-08 13:37:35.597237	78	0	78	78
2021-11-08 13:37:35.61473	2021-11-08 13:37:35.61473	79	0	79	79
2021-11-08 13:37:35.630333	2021-11-08 13:37:35.630333	80	0	80	80
2021-11-08 13:37:35.645016	2021-11-08 13:37:35.645016	81	0	81	81
2021-11-08 13:37:35.659681	2021-11-08 13:37:35.659681	82	0	82	82
2021-11-08 13:37:35.682175	2021-11-08 13:37:35.682175	83	0	83	83
2021-11-08 13:37:35.734826	2021-11-08 13:37:35.734826	84	0	84	84
2021-11-08 13:37:35.813634	2021-11-08 13:37:35.813634	85	0	85	85
2021-11-08 13:37:35.883454	2021-11-08 13:37:35.883454	86	0	86	86
2021-11-08 13:37:35.937183	2021-11-08 13:37:35.937183	87	0	87	87
2021-11-08 13:37:35.99085	2021-11-08 13:37:35.99085	88	0	88	88
2021-11-08 13:37:36.080553	2021-11-08 13:37:36.080553	89	0	89	89
2021-11-08 13:37:36.103086	2021-11-08 13:37:36.103086	90	0	90	90
2021-11-08 13:37:36.123344	2021-11-08 13:37:36.123344	91	0	91	91
2021-11-08 13:37:36.140396	2021-11-08 13:37:36.140396	92	0	92	92
2021-11-08 13:37:36.156947	2021-11-08 13:37:36.156947	93	0	93	93
2021-11-08 13:37:36.175665	2021-11-08 13:37:36.175665	94	0	94	94
2021-11-08 13:37:36.196236	2021-11-08 13:37:36.196236	95	0	95	95
2021-11-08 13:37:36.213083	2021-11-08 13:37:36.213083	96	0	96	96
2021-11-08 13:37:36.232245	2021-11-08 13:37:36.232245	97	0	97	97
2021-11-08 13:37:36.258754	2021-11-08 13:37:36.258754	98	0	98	98
2021-11-08 13:37:36.277255	2021-11-08 13:37:36.277255	99	0	99	99
2021-11-08 13:37:36.29457	2021-11-08 13:37:36.29457	100	0	100	100
2021-11-08 13:37:36.310805	2021-11-08 13:37:36.310805	101	0	101	101
2021-11-08 13:37:36.327815	2021-11-08 13:37:36.327815	102	0	102	102
2021-11-08 13:37:36.3434	2021-11-08 13:37:36.3434	103	0	103	103
2021-11-08 13:37:36.359877	2021-11-08 13:37:36.359877	104	0	104	104
2021-11-08 13:37:36.376668	2021-11-08 13:37:36.376668	105	0	105	105
2021-11-08 13:37:36.391853	2021-11-08 13:37:36.391853	106	0	106	106
2021-11-08 13:37:36.40738	2021-11-08 13:37:36.40738	107	0	107	107
2021-11-08 13:37:36.42439	2021-11-08 13:37:36.42439	108	0	108	108
\.


--
-- Data for Name: product_channels_channel; Type: TABLE DATA; Schema: public; Owner: ghienan
--

COPY public.product_channels_channel ("productId", "channelId") FROM stdin;
1	1
2	1
3	1
4	1
5	1
6	1
7	1
8	1
9	1
10	1
11	1
12	1
13	1
14	1
15	1
16	1
17	1
18	1
19	1
20	1
21	1
22	1
23	1
24	1
25	1
26	1
27	1
28	1
29	1
30	1
31	1
32	1
33	1
34	1
35	1
36	1
37	1
38	1
39	1
40	1
41	1
42	1
43	1
44	1
45	1
46	1
47	1
48	1
49	1
50	1
51	1
52	1
53	1
54	1
55	1
56	1
57	1
58	1
59	1
60	1
61	1
62	1
63	1
64	1
65	1
66	1
67	1
68	1
69	1
70	1
71	1
72	1
73	1
74	1
75	1
76	1
77	1
78	1
79	1
80	1
81	1
82	1
83	1
84	1
85	1
86	1
87	1
88	1
89	1
90	1
91	1
92	1
93	1
94	1
95	1
96	1
97	1
98	1
99	1
100	1
101	1
102	1
103	1
104	1
105	1
106	1
107	1
108	1
\.


--
-- Data for Name: product_facet_values_facet_value; Type: TABLE DATA; Schema: public; Owner: ghienan
--

COPY public.product_facet_values_facet_value ("productId", "facetValueId") FROM stdin;
1	1
1	2
1	3
2	1
2	2
2	3
3	1
3	2
3	4
4	1
4	2
4	5
5	1
5	2
5	5
6	1
6	2
6	6
7	1
7	2
7	7
8	1
8	2
8	8
9	1
9	2
9	6
10	1
10	2
11	1
11	2
12	1
12	9
12	10
13	1
13	9
13	11
14	1
14	9
14	12
15	1
15	9
15	13
16	1
16	9
16	14
17	1
17	9
17	15
18	1
18	9
18	11
19	1
19	9
20	1
20	9
20	16
21	17
21	18
21	19
22	17
22	18
22	20
23	17
23	18
23	20
24	17
24	18
25	17
25	18
26	17
26	18
26	21
27	17
27	18
27	22
28	17
28	18
28	22
29	17
29	23
29	24
29	25
29	26
30	17
30	23
30	21
30	27
31	17
31	23
31	21
31	28
32	17
32	23
32	24
32	28
32	27
33	17
33	23
33	24
33	27
34	17
34	23
34	29
34	27
35	30
35	31
35	32
36	30
36	31
36	33
36	32
37	30
37	31
37	33
38	30
38	31
38	32
39	30
39	31
39	33
40	30
40	31
40	32
41	30
41	31
42	30
42	31
43	30
43	34
43	35
44	30
44	31
45	30
45	34
46	30
46	34
46	35
47	30
47	34
47	36
48	30
48	34
49	30
49	34
49	37
50	30
50	34
50	35
51	30
51	34
51	27
52	30
52	34
52	37
53	30
53	34
53	28
54	30
54	34
55	1
55	2
55	3
56	1
56	2
56	3
57	1
57	2
57	4
58	1
58	2
58	5
59	1
59	2
59	5
60	1
60	2
60	6
61	1
61	2
61	7
62	1
62	2
62	8
63	1
63	2
63	6
64	1
64	2
65	1
65	2
66	1
66	9
66	10
67	1
67	9
67	11
68	1
68	9
68	12
69	1
69	9
69	13
70	1
70	9
70	14
71	1
71	9
71	15
72	1
72	9
72	11
73	1
73	9
74	1
74	9
74	16
75	17
75	18
75	19
76	17
76	18
76	20
77	17
77	18
77	20
78	17
78	18
79	17
79	18
80	17
80	18
80	21
81	17
81	18
81	22
82	17
82	18
82	22
83	17
83	23
83	24
83	25
83	26
84	17
84	23
84	21
84	27
85	17
85	23
85	21
85	28
86	17
86	23
86	24
86	28
86	27
87	17
87	23
87	24
87	27
88	17
88	23
88	29
88	27
89	30
89	31
89	40
90	30
90	31
90	41
90	40
91	30
91	31
91	41
92	30
92	31
92	40
93	30
93	31
93	41
94	30
94	31
94	40
95	30
95	31
96	30
96	31
97	30
97	34
97	35
98	30
98	31
99	30
99	34
100	30
100	34
100	35
101	30
101	34
101	36
102	30
102	34
103	30
103	34
103	37
104	30
104	34
104	35
105	30
105	34
105	27
106	30
106	34
106	37
107	30
107	34
107	28
108	30
108	34
\.


--
-- Data for Name: product_option; Type: TABLE DATA; Schema: public; Owner: ghienan
--

COPY public.product_option ("createdAt", "updatedAt", "deletedAt", code, id, "groupId") FROM stdin;
2021-10-15 15:12:31.131339	2021-10-15 15:12:31.131339	\N	13-inch	1	1
2021-10-15 15:12:31.136587	2021-10-15 15:12:31.136587	\N	15-inch	2	1
2021-10-15 15:12:31.145081	2021-10-15 15:12:31.145081	\N	8gb	3	2
2021-10-15 15:12:31.148057	2021-10-15 15:12:31.148057	\N	16gb	4	2
2021-10-15 15:12:31.205718	2021-10-15 15:12:31.205718	\N	32gb	5	3
2021-10-15 15:12:31.20911	2021-10-15 15:12:31.20911	\N	128gb	6	3
2021-10-15 15:12:31.290522	2021-10-15 15:12:31.290522	\N	24-inch	7	4
2021-10-15 15:12:31.29357	2021-10-15 15:12:31.29357	\N	27-inch	8	4
2021-10-15 15:12:31.332528	2021-10-15 15:12:31.332528	\N	4gb	9	5
2021-10-15 15:12:31.335245	2021-10-15 15:12:31.335245	\N	8gb	10	5
2021-10-15 15:12:31.337686	2021-10-15 15:12:31.337686	\N	16gb	11	5
2021-10-15 15:12:31.381835	2021-10-15 15:12:31.381835	\N	i7-8700	12	6
2021-10-15 15:12:31.386659	2021-10-15 15:12:31.386659	\N	r7-2700	13	6
2021-10-15 15:12:31.394251	2021-10-15 15:12:31.394251	\N	240gb-ssd	14	7
2021-10-15 15:12:31.397856	2021-10-15 15:12:31.397856	\N	120gb-ssd	15	7
2021-10-15 15:12:31.450075	2021-10-15 15:12:31.450075	\N	1tb	16	8
2021-10-15 15:12:31.453605	2021-10-15 15:12:31.453605	\N	2tb	17	8
2021-10-15 15:12:31.456082	2021-10-15 15:12:31.456082	\N	3tb	18	8
2021-10-15 15:12:31.458607	2021-10-15 15:12:31.458607	\N	4tb	19	8
2021-10-15 15:12:31.46107	2021-10-15 15:12:31.46107	\N	6tb	20	8
2021-10-15 15:12:31.973619	2021-10-15 15:12:31.973619	\N	size-40	21	9
2021-10-15 15:12:31.978255	2021-10-15 15:12:31.978255	\N	size-42	22	9
2021-10-15 15:12:31.981259	2021-10-15 15:12:31.981259	\N	size-44	23	9
2021-10-15 15:12:31.98418	2021-10-15 15:12:31.98418	\N	size-46	24	9
2021-10-15 15:12:32.032567	2021-10-15 15:12:32.032567	\N	size-40	25	10
2021-10-15 15:12:32.035353	2021-10-15 15:12:32.035353	\N	size-42	26	10
2021-10-15 15:12:32.037836	2021-10-15 15:12:32.037836	\N	size-44	27	10
2021-10-15 15:12:32.041452	2021-10-15 15:12:32.041452	\N	size-46	28	10
2021-10-15 15:12:32.090021	2021-10-15 15:12:32.090021	\N	size-40	29	11
2021-10-15 15:12:32.09413	2021-10-15 15:12:32.09413	\N	size-42	30	11
2021-10-15 15:12:32.097468	2021-10-15 15:12:32.097468	\N	size-44	31	11
2021-10-15 15:12:32.100258	2021-10-15 15:12:32.100258	\N	size-46	32	11
2021-10-15 15:12:32.142861	2021-10-15 15:12:32.142861	\N	size-40	33	12
2021-10-15 15:12:32.145261	2021-10-15 15:12:32.145261	\N	size-42	34	12
2021-10-15 15:12:32.147972	2021-10-15 15:12:32.147972	\N	size-44	35	12
2021-10-15 15:12:32.150807	2021-10-15 15:12:32.150807	\N	size-46	36	12
2021-10-15 15:12:32.192566	2021-10-15 15:12:32.192566	\N	size-40	37	13
2021-10-15 15:12:32.195948	2021-10-15 15:12:32.195948	\N	size-42	38	13
2021-10-15 15:12:32.199409	2021-10-15 15:12:32.199409	\N	size-44	39	13
2021-10-15 15:12:32.202037	2021-10-15 15:12:32.202037	\N	size-46	40	13
2021-10-15 15:12:32.262791	2021-10-15 15:12:32.262791	\N	size-40	41	14
2021-10-15 15:12:32.271145	2021-10-15 15:12:32.271145	\N	size-42	42	14
2021-10-15 15:12:32.275573	2021-10-15 15:12:32.275573	\N	size-44	43	14
2021-10-15 15:12:32.281218	2021-10-15 15:12:32.281218	\N	size-46	44	14
2021-10-15 15:12:32.769242	2021-10-15 15:12:32.769242	\N	mustard	45	15
2021-10-15 15:12:32.771705	2021-10-15 15:12:32.771705	\N	mint	46	15
2021-10-15 15:12:32.774111	2021-10-15 15:12:32.774111	\N	pearl	47	15
2021-11-08 13:37:34.877967	2021-11-08 13:37:34.877967	\N	13-inch	48	16
2021-11-08 13:37:34.885766	2021-11-08 13:37:34.885766	\N	15-inch	49	16
2021-11-08 13:37:34.895909	2021-11-08 13:37:34.895909	\N	8gb	50	17
2021-11-08 13:37:34.899562	2021-11-08 13:37:34.899562	\N	16gb	51	17
2021-11-08 13:37:34.985581	2021-11-08 13:37:34.985581	\N	32gb	52	18
2021-11-08 13:37:34.990204	2021-11-08 13:37:34.990204	\N	128gb	53	18
2021-11-08 13:37:35.071598	2021-11-08 13:37:35.071598	\N	24-inch	54	19
2021-11-08 13:37:35.077898	2021-11-08 13:37:35.077898	\N	27-inch	55	19
2021-11-08 13:37:35.122345	2021-11-08 13:37:35.122345	\N	4gb	56	20
2021-11-08 13:37:35.125809	2021-11-08 13:37:35.125809	\N	8gb	57	20
2021-11-08 13:37:35.128777	2021-11-08 13:37:35.128777	\N	16gb	58	20
2021-11-08 13:37:35.167546	2021-11-08 13:37:35.167546	\N	i7-8700	59	21
2021-11-08 13:37:35.173758	2021-11-08 13:37:35.173758	\N	r7-2700	60	21
2021-11-08 13:37:35.184386	2021-11-08 13:37:35.184386	\N	240gb-ssd	61	22
2021-11-08 13:37:35.190325	2021-11-08 13:37:35.190325	\N	120gb-ssd	62	22
2021-11-08 13:37:35.248653	2021-11-08 13:37:35.248653	\N	1tb	63	23
2021-11-08 13:37:35.254776	2021-11-08 13:37:35.254776	\N	2tb	64	23
2021-11-08 13:37:35.259566	2021-11-08 13:37:35.259566	\N	3tb	65	23
2021-11-08 13:37:35.26276	2021-11-08 13:37:35.26276	\N	4tb	66	23
2021-11-08 13:37:35.265512	2021-11-08 13:37:35.265512	\N	6tb	67	23
2021-11-08 13:37:35.688083	2021-11-08 13:37:35.688083	\N	size-40	68	24
2021-11-08 13:37:35.690789	2021-11-08 13:37:35.690789	\N	size-42	69	24
2021-11-08 13:37:35.694428	2021-11-08 13:37:35.694428	\N	size-44	70	24
2021-11-08 13:37:35.697141	2021-11-08 13:37:35.697141	\N	size-46	71	24
2021-11-08 13:37:35.7395	2021-11-08 13:37:35.7395	\N	size-40	72	25
2021-11-08 13:37:35.741916	2021-11-08 13:37:35.741916	\N	size-42	73	25
2021-11-08 13:37:35.744348	2021-11-08 13:37:35.744348	\N	size-44	74	25
2021-11-08 13:37:35.74775	2021-11-08 13:37:35.74775	\N	size-46	75	25
2021-11-08 13:37:35.822934	2021-11-08 13:37:35.822934	\N	size-40	76	26
2021-11-08 13:37:35.827026	2021-11-08 13:37:35.827026	\N	size-42	77	26
2021-11-08 13:37:35.830095	2021-11-08 13:37:35.830095	\N	size-44	78	26
2021-11-08 13:37:35.832694	2021-11-08 13:37:35.832694	\N	size-46	79	26
2021-11-08 13:37:35.889468	2021-11-08 13:37:35.889468	\N	size-40	80	27
2021-11-08 13:37:35.892117	2021-11-08 13:37:35.892117	\N	size-42	81	27
2021-11-08 13:37:35.894699	2021-11-08 13:37:35.894699	\N	size-44	82	27
2021-11-08 13:37:35.897522	2021-11-08 13:37:35.897522	\N	size-46	83	27
2021-11-08 13:37:35.941779	2021-11-08 13:37:35.941779	\N	size-40	84	28
2021-11-08 13:37:35.945215	2021-11-08 13:37:35.945215	\N	size-42	85	28
2021-11-08 13:37:35.947784	2021-11-08 13:37:35.947784	\N	size-44	86	28
2021-11-08 13:37:35.9504	2021-11-08 13:37:35.9504	\N	size-46	87	28
2021-11-08 13:37:35.996414	2021-11-08 13:37:35.996414	\N	size-40	88	29
2021-11-08 13:37:36.000125	2021-11-08 13:37:36.000125	\N	size-42	89	29
2021-11-08 13:37:36.003902	2021-11-08 13:37:36.003902	\N	size-44	90	29
2021-11-08 13:37:36.006338	2021-11-08 13:37:36.006338	\N	size-46	91	29
2021-11-08 13:37:36.428892	2021-11-08 13:37:36.428892	\N	mustard	92	30
2021-11-08 13:37:36.431282	2021-11-08 13:37:36.431282	\N	mint	93	30
2021-11-08 13:37:36.433587	2021-11-08 13:37:36.433587	\N	pearl	94	30
\.


--
-- Data for Name: product_option_group; Type: TABLE DATA; Schema: public; Owner: ghienan
--

COPY public.product_option_group ("createdAt", "updatedAt", "deletedAt", code, id, "productId") FROM stdin;
2021-10-15 15:12:31.125407	2021-10-15 15:12:31.13979	\N	laptop-screen-size	1	1
2021-10-15 15:12:31.142168	2021-10-15 15:12:31.14988	\N	laptop-ram	2	1
2021-10-15 15:12:31.203039	2021-10-15 15:12:31.211357	\N	tablet-storage	3	2
2021-10-15 15:12:31.287111	2021-10-15 15:12:31.296792	\N	curvy-monitor-monitor-size	4	5
2021-10-15 15:12:31.329273	2021-10-15 15:12:31.339266	\N	high-performance-ram-size	5	6
2021-10-15 15:12:31.378932	2021-10-15 15:12:31.388759	\N	gaming-pc-cpu	6	7
2021-10-15 15:12:31.391113	2021-10-15 15:12:31.40004	\N	gaming-pc-hdd	7	7
2021-10-15 15:12:31.446774	2021-10-15 15:12:31.462626	\N	hard-drive-hdd	8	8
2021-10-15 15:12:31.967296	2021-10-15 15:12:31.985833	\N	ultraboost-running-shoe-size	9	29
2021-10-15 15:12:32.029119	2021-10-15 15:12:32.04325	\N	freerun-running-shoe-size	10	30
2021-10-15 15:12:32.087475	2021-10-15 15:12:32.101887	\N	hi-top-basketball-shoe-size	11	31
2021-10-15 15:12:32.140109	2021-10-15 15:12:32.152869	\N	pureboost-running-shoe-size	12	32
2021-10-15 15:12:32.190232	2021-10-15 15:12:32.203512	\N	runx-running-shoe-size	13	33
2021-10-15 15:12:32.258398	2021-10-15 15:12:32.283947	\N	allstar-sneakers-size	14	34
2021-10-15 15:12:32.766614	2021-10-15 15:12:32.775664	\N	modern-cafe-chair-color	15	54
2021-11-08 13:37:34.866871	2021-11-08 13:37:34.890501	\N	laptop-screen-size	16	55
2021-11-08 13:37:34.892798	2021-11-08 13:37:34.901587	\N	laptop-ram	17	55
2021-11-08 13:37:34.982454	2021-11-08 13:37:34.992363	\N	tablet-storage	18	56
2021-11-08 13:37:35.067865	2021-11-08 13:37:35.080439	\N	curvy-monitor-monitor-size	19	59
2021-11-08 13:37:35.117883	2021-11-08 13:37:35.130542	\N	high-performance-ram-size	20	60
2021-11-08 13:37:35.164323	2021-11-08 13:37:35.175955	\N	gaming-pc-cpu	21	61
2021-11-08 13:37:35.178113	2021-11-08 13:37:35.192401	\N	gaming-pc-hdd	22	61
2021-11-08 13:37:35.244668	2021-11-08 13:37:35.267218	\N	hard-drive-hdd	23	62
2021-11-08 13:37:35.684614	2021-11-08 13:37:35.698824	\N	ultraboost-running-shoe-size	24	83
2021-11-08 13:37:35.737089	2021-11-08 13:37:35.74953	\N	freerun-running-shoe-size	25	84
2021-11-08 13:37:35.817413	2021-11-08 13:37:35.834325	\N	hi-top-basketball-shoe-size	26	85
2021-11-08 13:37:35.886571	2021-11-08 13:37:35.899235	\N	pureboost-running-shoe-size	27	86
2021-11-08 13:37:35.939355	2021-11-08 13:37:35.952257	\N	runx-running-shoe-size	28	87
2021-11-08 13:37:35.993009	2021-11-08 13:37:36.007845	\N	allstar-sneakers-size	29	88
2021-11-08 13:37:36.4266	2021-11-08 13:37:36.435164	\N	modern-cafe-chair-color	30	108
\.


--
-- Data for Name: product_option_group_translation; Type: TABLE DATA; Schema: public; Owner: ghienan
--

COPY public.product_option_group_translation ("createdAt", "updatedAt", "languageCode", name, id, "baseId") FROM stdin;
2021-10-15 15:12:31.122675	2021-10-15 15:12:31.125407	en	screen size	1	1
2021-10-15 15:12:31.140659	2021-10-15 15:12:31.142168	en	RAM	2	2
2021-10-15 15:12:31.201949	2021-10-15 15:12:31.203039	en	storage	3	3
2021-10-15 15:12:31.286104	2021-10-15 15:12:31.287111	en	monitor size	4	4
2021-10-15 15:12:31.328237	2021-10-15 15:12:31.329273	en	size	5	5
2021-10-15 15:12:31.377808	2021-10-15 15:12:31.378932	en	cpu	6	6
2021-10-15 15:12:31.389661	2021-10-15 15:12:31.391113	en	HDD	7	7
2021-10-15 15:12:31.445336	2021-10-15 15:12:31.446774	en	HDD	8	8
2021-10-15 15:12:31.965392	2021-10-15 15:12:31.967296	en	size	9	9
2021-10-15 15:12:32.027457	2021-10-15 15:12:32.029119	en	size	10	10
2021-10-15 15:12:32.086458	2021-10-15 15:12:32.087475	en	size	11	11
2021-10-15 15:12:32.139189	2021-10-15 15:12:32.140109	en	size	12	12
2021-10-15 15:12:32.189274	2021-10-15 15:12:32.190232	en	size	13	13
2021-10-15 15:12:32.256767	2021-10-15 15:12:32.258398	en	size	14	14
2021-10-15 15:12:32.765436	2021-10-15 15:12:32.766614	en	color	15	15
2021-11-08 13:37:34.862193	2021-11-08 13:37:34.866871	en	screen size	16	16
2021-11-08 13:37:34.891462	2021-11-08 13:37:34.892798	en	RAM	17	17
2021-11-08 13:37:34.981037	2021-11-08 13:37:34.982454	en	storage	18	18
2021-11-08 13:37:35.066682	2021-11-08 13:37:35.067865	en	monitor size	19	19
2021-11-08 13:37:35.11642	2021-11-08 13:37:35.117883	en	size	20	20
2021-11-08 13:37:35.163113	2021-11-08 13:37:35.164323	en	cpu	21	21
2021-11-08 13:37:35.176745	2021-11-08 13:37:35.178113	en	HDD	22	22
2021-11-08 13:37:35.243073	2021-11-08 13:37:35.244668	en	HDD	23	23
2021-11-08 13:37:35.683359	2021-11-08 13:37:35.684614	en	size	24	24
2021-11-08 13:37:35.735974	2021-11-08 13:37:35.737089	en	size	25	25
2021-11-08 13:37:35.815705	2021-11-08 13:37:35.817413	en	size	26	26
2021-11-08 13:37:35.884787	2021-11-08 13:37:35.886571	en	size	27	27
2021-11-08 13:37:35.938289	2021-11-08 13:37:35.939355	en	size	28	28
2021-11-08 13:37:35.991972	2021-11-08 13:37:35.993009	en	size	29	29
2021-11-08 13:37:36.425641	2021-11-08 13:37:36.4266	en	color	30	30
\.


--
-- Data for Name: product_option_translation; Type: TABLE DATA; Schema: public; Owner: ghienan
--

COPY public.product_option_translation ("createdAt", "updatedAt", "languageCode", name, id, "baseId") FROM stdin;
2021-10-15 15:12:31.128415	2021-10-15 15:12:31.131339	en	13 inch	1	1
2021-10-15 15:12:31.134889	2021-10-15 15:12:31.136587	en	15 inch	2	2
2021-10-15 15:12:31.143883	2021-10-15 15:12:31.145081	en	8GB	3	3
2021-10-15 15:12:31.146905	2021-10-15 15:12:31.148057	en	16GB	4	4
2021-10-15 15:12:31.204644	2021-10-15 15:12:31.205718	en	32GB	5	5
2021-10-15 15:12:31.207554	2021-10-15 15:12:31.20911	en	128GB	6	6
2021-10-15 15:12:31.288592	2021-10-15 15:12:31.290522	en	24 inch	7	7
2021-10-15 15:12:31.292266	2021-10-15 15:12:31.29357	en	27 inch	8	8
2021-10-15 15:12:31.331298	2021-10-15 15:12:31.332528	en	4GB	9	9
2021-10-15 15:12:31.334209	2021-10-15 15:12:31.335245	en	8GB	10	10
2021-10-15 15:12:31.336725	2021-10-15 15:12:31.337686	en	16GB	11	11
2021-10-15 15:12:31.380748	2021-10-15 15:12:31.381835	en	i7-8700	12	12
2021-10-15 15:12:31.383438	2021-10-15 15:12:31.386659	en	R7-2700	13	13
2021-10-15 15:12:31.392919	2021-10-15 15:12:31.394251	en	240GB SSD	14	14
2021-10-15 15:12:31.396207	2021-10-15 15:12:31.397856	en	120GB SSD	15	15
2021-10-15 15:12:31.448967	2021-10-15 15:12:31.450075	en	1TB	16	16
2021-10-15 15:12:31.452335	2021-10-15 15:12:31.453605	en	2TB	17	17
2021-10-15 15:12:31.455145	2021-10-15 15:12:31.456082	en	3TB	18	18
2021-10-15 15:12:31.457602	2021-10-15 15:12:31.458607	en	4TB	19	19
2021-10-15 15:12:31.460076	2021-10-15 15:12:31.46107	en	6TB	20	20
2021-10-15 15:12:31.971096	2021-10-15 15:12:31.973619	en	Size 40	21	21
2021-10-15 15:12:31.976975	2021-10-15 15:12:31.978255	en	Size 42	22	22
2021-10-15 15:12:31.980022	2021-10-15 15:12:31.981259	en	Size 44	23	23
2021-10-15 15:12:31.983113	2021-10-15 15:12:31.98418	en	Size 46	24	24
2021-10-15 15:12:32.031479	2021-10-15 15:12:32.032567	en	Size 40	25	25
2021-10-15 15:12:32.03428	2021-10-15 15:12:32.035353	en	Size 42	26	26
2021-10-15 15:12:32.036878	2021-10-15 15:12:32.037836	en	Size 44	27	27
2021-10-15 15:12:32.039946	2021-10-15 15:12:32.041452	en	Size 46	28	28
2021-10-15 15:12:32.088989	2021-10-15 15:12:32.090021	en	Size 40	29	29
2021-10-15 15:12:32.09296	2021-10-15 15:12:32.09413	en	Size 42	30	30
2021-10-15 15:12:32.095788	2021-10-15 15:12:32.097468	en	Size 44	31	31
2021-10-15 15:12:32.099139	2021-10-15 15:12:32.100258	en	Size 46	32	32
2021-10-15 15:12:32.141805	2021-10-15 15:12:32.142861	en	Size 40	33	33
2021-10-15 15:12:32.14432	2021-10-15 15:12:32.145261	en	Size 42	34	34
2021-10-15 15:12:32.146842	2021-10-15 15:12:32.147972	en	Size 44	35	35
2021-10-15 15:12:32.149557	2021-10-15 15:12:32.150807	en	Size 46	36	36
2021-10-15 15:12:32.191639	2021-10-15 15:12:32.192566	en	Size 40	37	37
2021-10-15 15:12:32.194849	2021-10-15 15:12:32.195948	en	Size 42	38	38
2021-10-15 15:12:32.19821	2021-10-15 15:12:32.199409	en	Size 44	39	39
2021-10-15 15:12:32.201087	2021-10-15 15:12:32.202037	en	Size 46	40	40
2021-10-15 15:12:32.26105	2021-10-15 15:12:32.262791	en	Size 40	41	41
2021-10-15 15:12:32.268388	2021-10-15 15:12:32.271145	en	Size 42	42	42
2021-10-15 15:12:32.274033	2021-10-15 15:12:32.275573	en	Size 44	43	43
2021-10-15 15:12:32.27863	2021-10-15 15:12:32.281218	en	Size 46	44	44
2021-10-15 15:12:32.768223	2021-10-15 15:12:32.769242	en	mustard	45	45
2021-10-15 15:12:32.770722	2021-10-15 15:12:32.771705	en	mint	46	46
2021-10-15 15:12:32.773141	2021-10-15 15:12:32.774111	en	pearl	47	47
2021-11-08 13:37:34.873088	2021-11-08 13:37:34.877967	en	13 inch	48	48
2021-11-08 13:37:34.884132	2021-11-08 13:37:34.885766	en	15 inch	49	49
2021-11-08 13:37:34.894705	2021-11-08 13:37:34.895909	en	8GB	50	50
2021-11-08 13:37:34.898346	2021-11-08 13:37:34.899562	en	16GB	51	51
2021-11-08 13:37:34.984255	2021-11-08 13:37:34.985581	en	32GB	52	52
2021-11-08 13:37:34.988623	2021-11-08 13:37:34.990204	en	128GB	53	53
2021-11-08 13:37:35.069959	2021-11-08 13:37:35.071598	en	24 inch	54	54
2021-11-08 13:37:35.07638	2021-11-08 13:37:35.077898	en	27 inch	55	55
2021-11-08 13:37:35.120357	2021-11-08 13:37:35.122345	en	4GB	56	56
2021-11-08 13:37:35.124394	2021-11-08 13:37:35.125809	en	8GB	57	57
2021-11-08 13:37:35.127612	2021-11-08 13:37:35.128777	en	16GB	58	58
2021-11-08 13:37:35.16632	2021-11-08 13:37:35.167546	en	i7-8700	59	59
2021-11-08 13:37:35.170378	2021-11-08 13:37:35.173758	en	R7-2700	60	60
2021-11-08 13:37:35.183037	2021-11-08 13:37:35.184386	en	240GB SSD	61	61
2021-11-08 13:37:35.187899	2021-11-08 13:37:35.190325	en	120GB SSD	62	62
2021-11-08 13:37:35.246917	2021-11-08 13:37:35.248653	en	1TB	63	63
2021-11-08 13:37:35.251201	2021-11-08 13:37:35.254776	en	2TB	64	64
2021-11-08 13:37:35.258129	2021-11-08 13:37:35.259566	en	3TB	65	65
2021-11-08 13:37:35.261459	2021-11-08 13:37:35.26276	en	4TB	66	66
2021-11-08 13:37:35.264444	2021-11-08 13:37:35.265512	en	6TB	67	67
2021-11-08 13:37:35.686856	2021-11-08 13:37:35.688083	en	Size 40	68	68
2021-11-08 13:37:35.689751	2021-11-08 13:37:35.690789	en	Size 42	69	69
2021-11-08 13:37:35.693341	2021-11-08 13:37:35.694428	en	Size 44	70	70
2021-11-08 13:37:35.695892	2021-11-08 13:37:35.697141	en	Size 46	71	71
2021-11-08 13:37:35.738522	2021-11-08 13:37:35.7395	en	Size 40	72	72
2021-11-08 13:37:35.740931	2021-11-08 13:37:35.741916	en	Size 42	73	73
2021-11-08 13:37:35.743357	2021-11-08 13:37:35.744348	en	Size 44	74	74
2021-11-08 13:37:35.745868	2021-11-08 13:37:35.74775	en	Size 46	75	75
2021-11-08 13:37:35.821118	2021-11-08 13:37:35.822934	en	Size 40	76	76
2021-11-08 13:37:35.825982	2021-11-08 13:37:35.827026	en	Size 42	77	77
2021-11-08 13:37:35.828905	2021-11-08 13:37:35.830095	en	Size 44	78	78
2021-11-08 13:37:35.831699	2021-11-08 13:37:35.832694	en	Size 46	79	79
2021-11-08 13:37:35.888399	2021-11-08 13:37:35.889468	en	Size 40	80	80
2021-11-08 13:37:35.891063	2021-11-08 13:37:35.892117	en	Size 42	81	81
2021-11-08 13:37:35.893691	2021-11-08 13:37:35.894699	en	Size 44	82	82
2021-11-08 13:37:35.896126	2021-11-08 13:37:35.897522	en	Size 46	83	83
2021-11-08 13:37:35.940824	2021-11-08 13:37:35.941779	en	Size 40	84	84
2021-11-08 13:37:35.943208	2021-11-08 13:37:35.945215	en	Size 42	85	85
2021-11-08 13:37:35.94677	2021-11-08 13:37:35.947784	en	Size 44	86	86
2021-11-08 13:37:35.949352	2021-11-08 13:37:35.9504	en	Size 46	87	87
2021-11-08 13:37:35.994971	2021-11-08 13:37:35.996414	en	Size 40	88	88
2021-11-08 13:37:35.998283	2021-11-08 13:37:36.000125	en	Size 42	89	89
2021-11-08 13:37:36.002479	2021-11-08 13:37:36.003902	en	Size 44	90	90
2021-11-08 13:37:36.005395	2021-11-08 13:37:36.006338	en	Size 46	91	91
2021-11-08 13:37:36.427986	2021-11-08 13:37:36.428892	en	mustard	92	92
2021-11-08 13:37:36.430335	2021-11-08 13:37:36.431282	en	mint	93	93
2021-11-08 13:37:36.43269	2021-11-08 13:37:36.433587	en	pearl	94	94
\.


--
-- Data for Name: product_translation; Type: TABLE DATA; Schema: public; Owner: ghienan
--

COPY public.product_translation ("createdAt", "updatedAt", "languageCode", name, slug, description, id, "baseId") FROM stdin;
2021-10-15 15:12:31.106526	2021-10-15 15:12:31.109483	en	Laptop	laptop	Now equipped with seventh-generation Intel Core processors, Laptop is snappier than ever. From daily tasks like launching apps and opening files to more advanced computing, you can power through your day thanks to faster SSDs and Turbo Boost processing up to 3.6GHz.	1	1
2021-10-15 15:12:31.196731	2021-10-15 15:12:31.197902	en	Tablet	tablet	If the computer were invented today, what would it look like? It would be powerful enough for any task. So mobile you could take it everywhere. And so intuitive you could use it any way you wanted ΓÇö with touch, a keyboard, or even a pencil. In other words, it wouldnΓÇÖt really be a "computer." It would be Tablet.	2	2
2021-10-15 15:12:31.239364	2021-10-15 15:12:31.240625	en	Wireless Optical Mouse	cordless-mouse	The Logitech M185 Wireless Optical Mouse is a great device for any computer user, and as Logitech are the global market leaders for these devices, you are also guaranteed absolute reliability. A mouse to be reckoned with!	3	3
2021-10-15 15:12:31.263374	2021-10-15 15:12:31.264845	en	32-Inch Monitor	32-inch-monitor	The UJ59 with Ultra HD resolution has 4x the pixels of Full HD, delivering more screen space and amazingly life-like images. That means you can view documents and webpages with less scrolling, work more comfortably with multiple windows and toolbars, and enjoy photos, videos and games in stunning 4K quality. Note: beverage not included.	4	4
2021-10-15 15:12:31.280606	2021-10-15 15:12:31.281925	en	Curvy Monitor	curvy-monitor	Discover a truly immersive viewing experience with this monitor curved more deeply than any other. Wrapping around your field of vision the 1,800 R screencreates a wider field of view, enhances depth perception, and minimises peripheral distractions to draw you deeper in to your content.	5	5
2021-10-15 15:12:31.323499	2021-10-15 15:12:31.324635	en	High Performance RAM	high-performance-ram	Each RAM module is built with a pure aluminium heat spreader for faster heat dissipation and cooler operation. Enhanced to XMP 2.0 profiles for better overclocking; Compatibility: Intel 100 Series, Intel 200 Series, Intel 300 Series, Intel X299, AMD 300 Series, AMD 400 Series.	6	6
2021-10-15 15:12:31.37186	2021-10-15 15:12:31.372985	en	Gaming PC	gaming-pc	This pc is optimised for gaming, and is also VR ready. The Intel Core-i7 CPU and High Performance GPU give the computer the raw power it needs to function at a high level.	7	7
2021-10-15 15:12:31.439682	2021-10-15 15:12:31.440801	en	Hard Drive	hard-drive	Boost your PC storage with this internal hard drive, designed just for desktop and all-in-one PCs.	8	8
2021-10-15 15:12:31.502385	2021-10-15 15:12:31.503546	en	Clacky Keyboard	clacky-keyboard	Let all your colleagues know that you are typing on this exclusive, colorful klicky-klacky keyboard. Huge travel on each keypress ensures maximum klack on each and every keystroke.	9	9
2021-10-15 15:12:31.5187	2021-10-15 15:12:31.519742	en	Ethernet Cable	ethernet-cable	5m (metres) Cat.6 network cable (upwards/downwards compatible) | Patch cable | 2 RJ-45 plug | plug with bend protection mantle. High transmission speeds due to operating frequency with up to 250 MHz (in comparison to Cat.5/Cat.5e cable bandwidth of 100 MHz).	10	10
2021-10-15 15:12:31.534477	2021-10-15 15:12:31.535932	en	USB Cable	usb-cable	Solid conductors eliminate strand-interaction distortion and reduce jitter. As the surface is made of high-purity silver, the performance is very close to that of a solid silver cable, but priced much closer to solid copper cable.	11	11
2021-10-15 15:12:31.559363	2021-10-15 15:12:31.56045	en	Instant Camera	instant-camera	With its nostalgic design and simple point-and-shoot functionality, the Instant Camera is the perfect pick to get started with instant photography.	12	12
2021-10-15 15:12:31.583228	2021-10-15 15:12:31.584549	en	Camera Lens	camera-lens	This lens is a Di type lens using an optical system with improved multi-coating designed to function with digital SLR cameras as well as film cameras.	13	13
2021-10-15 15:12:31.60605	2021-10-15 15:12:31.60712	en	Vintage Folding Camera	vintage-folding-camera	This vintage folding camera is so antiquated that you cannot possibly hope to produce actual photographs with it. However, it makes a wonderful decorative piece for the home or office.	14	14
2021-10-15 15:12:31.626143	2021-10-15 15:12:31.62741	en	Tripod	tripod	Capture vivid, professional-style photographs with help from this lightweight tripod. The adjustable-height tripod makes it easy to achieve reliable stability and score just the right angle when going after that award-winning shot.	15	15
2021-10-15 15:12:31.647694	2021-10-15 15:12:31.648731	en	Instamatic Camera	instamatic-camera	This inexpensive point-and-shoot camera uses easy-to-load 126 film cartridges. A built-in flash unit ensure great results, no matter the lighting conditions.	16	16
2021-10-15 15:12:31.670276	2021-10-15 15:12:31.671349	en	Compact Digital Camera	compact-digital-camera	Unleash your creative potential with high-level performance and advanced features such as AI-powered Real-time Eye AF; new, high-precision Real-time Tracking; high-speed continuous shooting and 4K HDR movie-shooting. The camera's innovative AF quickly and reliably detects the position of the subject and then tracks the subject's motion, keeping it in sharp focus.	17	17
2021-10-15 15:12:31.686932	2021-10-15 15:12:31.689125	en	Nikkormat SLR Camera	nikkormat-slr-camera	The Nikkormat FS was brought to market by Nikon in 1965. The lens is a 50mm f1.4 Nikkor. Nice glass, smooth focus and a working diaphragm. A UV filter and a Nikon front lens cap are included with the lens.	18	18
2021-10-15 15:12:31.704383	2021-10-15 15:12:31.705463	en	Compact SLR Camera	compact-slr-camera	Retro styled, portable in size and built around a powerful 24-megapixel APS-C CMOS sensor, this digital camera is the ideal companion for creative everyday photography. Packed full of high spec features such as an advanced hybrid autofocus system able to keep pace with even the most active subjects, a speedy 6fps continuous-shooting mode, high-resolution electronic viewfinder and intuitive swivelling touchscreen, it brings professional image making into everyoneΓÇÖs grasp.	19	19
2021-10-15 15:12:31.725099	2021-10-15 15:12:31.726162	en	Twin Lens Camera	twin-lens-camera	What makes a Rolleiflex TLR so special? Many things. To start, TLR stands for twin lens reflex. ΓÇ£TwinΓÇ¥ because there are two lenses. And reflex means that the photographer looks through the lens to view the reflected image of an object or scene on the focusing screen.	20	20
2021-10-15 15:12:31.757064	2021-10-15 15:12:31.758267	en	Road Bike	road-bike	Featuring a full carbon chassis - complete with cyclocross-specific carbon fork - and a component setup geared for hard use on the race circuit, it's got the low weight, exceptional efficiency and brilliant handling you'll need to stay at the front of the pack.	21	21
2021-10-15 15:12:31.779503	2021-10-15 15:12:31.780925	en	Skipping Rope	skipping-rope	When you're working out you need a quality rope that doesn't tangle at every couple of jumps and with this skipping rope you won't have this problem. The fact that it looks like a pair of tasty frankfurters is merely a bonus.	22	22
2021-10-15 15:12:32.646384	2021-10-15 15:12:32.647851	en	Light Shade	light-shade	Modern tapered white polycotton pendant shade with a metallic silver chrome interior finish for maximum light reflection. Reversible gimble so it can be used as a ceiling shade or as a lamp shade.	48	48
2021-10-15 15:12:31.795566	2021-10-15 15:12:31.797845	en	Boxing Gloves	boxing-gloves	Training gloves designed for optimum training. Our gloves promote proper punching technique because they are conformed to the natural shape of your fist. Dense, innovative two-layer foam provides better shock absorbency and full padding on the front, back and wrist to promote proper punching technique.	23	23
2021-10-15 15:12:31.81478	2021-10-15 15:12:31.815986	en	Tent	tent	With tons of space inside (for max. 4 persons), full head height throughout the entire tent and an unusual and striking shape, this tent offers you everything you need.	24	24
2021-10-15 15:12:31.836071	2021-10-15 15:12:31.838066	en	Cruiser Skateboard	cruiser-skateboard	Based on the 1970s iconic shape, but made to a larger 69cm size, with updated, quality component, these skateboards are great for beginners to learn the foot spacing required, and are perfect for all-day cruising.	25	25
2021-10-15 15:12:31.872388	2021-10-15 15:12:31.873551	en	Football	football	This football features high-contrast graphics for high-visibility during play, while its machine-stitched tpu casing offers consistent performance.	26	26
2021-10-15 15:12:31.895305	2021-10-15 15:12:31.896904	en	Tennis Ball	tennis-ball	Our dog loves these tennis balls and they last for some time before they eventually either get lost in some field or bush or the covering comes off due to it being used most of the day every day.	27	27
2021-10-15 15:12:31.912869	2021-10-15 15:12:31.914227	en	Basketball	basketball	The Wilson MVP ball is perfect for playing basketball, and improving your skill for hours on end. Designed for new players, it is created with a high-quality rubber suitable for courts, allowing you to get full use during your practices.	28	28
2021-10-15 15:12:31.95999	2021-10-15 15:12:31.961197	en	Ultraboost Running Shoe	ultraboost-running-shoe	With its ultra-light, uber-responsive magic foam and a carbon fiber plate that feels like itΓÇÖs propelling you forward, the Running Shoe is ready to push you to victories both large and small	29	29
2021-10-15 15:12:32.022918	2021-10-15 15:12:32.024028	en	Freerun Running Shoe	freerun-running-shoe	The Freerun Men's Running Shoe is built for record-breaking speed. The Flyknit upper delivers ultra-lightweight support that fits like a glove.	30	30
2021-10-15 15:12:32.081054	2021-10-15 15:12:32.082402	en	Hi-Top Basketball Shoe	hi-top-basketball-shoe	Boasting legendary performance since 2008, the Hyperdunkz Basketball Shoe needs no gimmicks to stand out. Air units deliver best-in-class cushioning, while a dynamic lacing system keeps your foot snug and secure, so you can focus on your game and nothing else.	31	31
2021-10-15 15:12:32.134962	2021-10-15 15:12:32.136	en	Pureboost Running Shoe	pureboost-running-shoe	Built to handle curbs, corners and uneven sidewalks, these natural running shoes have an expanded landing zone and a heel plate for added stability. A lightweight and stretchy knit upper supports your native stride.	32	32
2021-10-15 15:12:32.184982	2021-10-15 15:12:32.186071	en	RunX Running Shoe	runx-running-shoe	These running shoes are made with an airy, lightweight mesh upper. The durable rubber outsole grips the pavement for added stability. A cushioned midsole brings comfort to each step.	33	33
2021-10-15 15:12:32.24593	2021-10-15 15:12:32.248687	en	Allstar Sneakers	allstar-sneakers	All Star is the most iconic sneaker in the world, recognised for its unmistakable silhouette, star-centred ankle patch and cultural authenticity. And like the best paradigms, it only gets better with time.	34	34
2021-10-15 15:12:32.352837	2021-10-15 15:12:32.35398	en	Spiky Cactus	spiky-cactus	A spiky yet elegant house cactus - perfect for the home or office. Origin and habitat: Probably native only to the Andes of Peru	35	35
2021-10-15 15:12:32.377719	2021-10-15 15:12:32.379178	en	Tulip Pot	tulip-pot	Bright crimson red species tulip with black centers, the poppy-like flowers will open up in full sun. Ideal for rock gardens, pots and border edging.	36	36
2021-10-15 15:12:32.39533	2021-10-15 15:12:32.396469	en	Hanging Plant	hanging-plant	Can be found in tropical and sub-tropical America where it grows on the branches of trees, but also on telephone wires and electricity cables and poles that sometimes topple with the weight of these plants. This plant loves a moist and warm air.	37	37
2021-10-15 15:12:32.412286	2021-10-15 15:12:32.41376	en	Aloe Vera	aloe-vera	Decorative Aloe vera makes a lovely house plant. A really trendy plant, Aloe vera is just so easy to care for. Aloe vera sap has been renowned for its remarkable medicinal and cosmetic properties for many centuries and has been used to treat grazes, insect bites and sunburn - it really works.	38	38
2021-10-15 15:12:32.428215	2021-10-15 15:12:32.429117	en	Fern Blechnum Gibbum	fern-blechnum-gibbum	Create a tropical feel in your home with this lush green tree fern, it has decorative leaves and will develop a short slender trunk in time.	39	39
2021-10-15 15:12:32.44567	2021-10-15 15:12:32.447004	en	Assorted Indoor Succulents	assorted-succulents	These assorted succulents come in a variety of different shapes and colours - each with their own unique personality. Succulents grow best in plenty of light: a sunny windowsill would be the ideal spot for them to thrive!	40	40
2021-10-15 15:12:32.460706	2021-10-15 15:12:32.46169	en	Orchid	orchid	Gloriously elegant. It can go along with any interior as it is a neutral color and the most popular Phalaenopsis overall. 2 to 3 foot stems host large white flowers that can last for over 2 months.	41	41
2021-10-15 15:12:32.475783	2021-10-15 15:12:32.476765	en	Bonsai Tree	bonsai-tree	Excellent semi-evergreen bonsai. Indoors or out but needs some winter protection. All trees sent will leave the nursery in excellent condition and will be of equal quality or better than the photograph shown.	42	42
2021-10-15 15:12:32.503706	2021-10-15 15:12:32.505164	en	Guardian Lion Statue	guardian-lion-statue	Placing it at home or office can bring you fortune and prosperity, guard your house and ward off ill fortune.	43	43
2021-10-15 15:12:32.539719	2021-10-15 15:12:32.540822	en	Hand Trowel	hand-trowel	Hand trowel for garden cultivating hammer finish epoxy-coated head for improved resistance to rust, scratches, humidity and alkalines in the soil.	44	44
2021-10-15 15:12:32.579744	2021-10-15 15:12:32.58523	en	Balloon Chair	balloon-chair	A charming vintage white wooden chair featuring an extremely spherical pink balloon. The balloon may be detached and used for other purposes, for example as a party decoration.	45	45
2021-10-15 15:12:32.606051	2021-10-15 15:12:32.607042	en	Grey Fabric Sofa	grey-fabric-sofa	Seat cushions filled with high resilience foam and polyester fibre wadding give comfortable support for your body, and easily regain their shape when you get up. The cover is easy to keep clean as it is removable and can be machine washed.	46	46
2021-10-15 15:12:32.628113	2021-10-15 15:12:32.629292	en	Leather Sofa	leather-sofa	This premium, tan-brown bonded leather seat is part of the 'chill' sofa range. The lever activated recline feature makes it easy to adjust to any position. This smart, bustle back design with rounded tight padded arms has been designed with your comfort in mind. This well-padded chair has foam pocket sprung seat cushions and fibre-filled back cushions.	47	47
2021-10-15 15:12:32.669402	2021-10-15 15:12:32.670762	en	Wooden Side Desk	wooden-side-desk	Drawer stops prevent the drawers from being pulled out too far. Built-in cable management for collecting cables and cords; out of sight but close at hand.	49	49
2021-10-15 15:12:32.688375	2021-10-15 15:12:32.689475	en	Comfy Padded Chair	comfy-padded-chair	You sit comfortably thanks to the shaped back. The chair frame is made of solid wood, which is a durable natural material.	50	50
2021-10-15 15:12:32.708225	2021-10-15 15:12:32.709383	en	Black Eaves Chair	black-eaves-chair	Comfortable to sit on thanks to the bowl-shaped seat and rounded shape of the backrest. No tools are required to assemble the chair, you just click it together with a simple mechanism under the seat.	51	51
2021-10-15 15:12:32.725562	2021-10-15 15:12:32.726614	en	Wooden Stool	wooden-stool	Solid wood is a hardwearing natural material, which can be sanded and surface treated as required.	52	52
2021-10-15 15:12:32.744041	2021-10-15 15:12:32.744954	en	Bedside Table	bedside-table	Every table is unique, with varying grain pattern and natural colour shifts that are part of the charm of wood.	53	53
2021-10-15 15:12:32.760643	2021-10-15 15:12:32.76174	en	Modern Cafe Chair	modern-cafe-chair	You sit comfortably thanks to the restful flexibility of the seat. Lightweight and easy to move around, yet stable enough even for the liveliest, young family members.	54	54
2021-11-08 13:37:34.830149	2021-11-08 13:37:34.836264	en	Laptop	laptop	Now equipped with seventh-generation Intel Core processors, Laptop is snappier than ever. From daily tasks like launching apps and opening files to more advanced computing, you can power through your day thanks to faster SSDs and Turbo Boost processing up to 3.6GHz.	55	55
2021-11-08 13:37:34.975486	2021-11-08 13:37:34.976645	en	Tablet	tablet	If the computer were invented today, what would it look like? It would be powerful enough for any task. So mobile you could take it everywhere. And so intuitive you could use it any way you wanted ΓÇö with touch, a keyboard, or even a pencil. In other words, it wouldnΓÇÖt really be a "computer." It would be Tablet.	56	56
2021-11-08 13:37:35.018012	2021-11-08 13:37:35.01961	en	Wireless Optical Mouse	cordless-mouse	The Logitech M185 Wireless Optical Mouse is a great device for any computer user, and as Logitech are the global market leaders for these devices, you are also guaranteed absolute reliability. A mouse to be reckoned with!	57	57
2021-11-08 13:37:35.040747	2021-11-08 13:37:35.041913	en	32-Inch Monitor	32-inch-monitor	The UJ59 with Ultra HD resolution has 4x the pixels of Full HD, delivering more screen space and amazingly life-like images. That means you can view documents and webpages with less scrolling, work more comfortably with multiple windows and toolbars, and enjoy photos, videos and games in stunning 4K quality. Note: beverage not included.	58	58
2021-11-08 13:37:35.060448	2021-11-08 13:37:35.061868	en	Curvy Monitor	curvy-monitor	Discover a truly immersive viewing experience with this monitor curved more deeply than any other. Wrapping around your field of vision the 1,800 R screencreates a wider field of view, enhances depth perception, and minimises peripheral distractions to draw you deeper in to your content.	59	59
2021-11-08 13:37:35.109544	2021-11-08 13:37:35.111549	en	High Performance RAM	high-performance-ram	Each RAM module is built with a pure aluminium heat spreader for faster heat dissipation and cooler operation. Enhanced to XMP 2.0 profiles for better overclocking; Compatibility: Intel 100 Series, Intel 200 Series, Intel 300 Series, Intel X299, AMD 300 Series, AMD 400 Series.	60	60
2021-11-08 13:37:35.158549	2021-11-08 13:37:35.159649	en	Gaming PC	gaming-pc	This pc is optimised for gaming, and is also VR ready. The Intel Core-i7 CPU and High Performance GPU give the computer the raw power it needs to function at a high level.	61	61
2021-11-08 13:37:35.234076	2021-11-08 13:37:35.235253	en	Hard Drive	hard-drive	Boost your PC storage with this internal hard drive, designed just for desktop and all-in-one PCs.	62	62
2021-11-08 13:37:35.307563	2021-11-08 13:37:35.308662	en	Clacky Keyboard	clacky-keyboard	Let all your colleagues know that you are typing on this exclusive, colorful klicky-klacky keyboard. Huge travel on each keypress ensures maximum klack on each and every keystroke.	63	63
2021-11-08 13:37:35.328297	2021-11-08 13:37:35.329724	en	Ethernet Cable	ethernet-cable	5m (metres) Cat.6 network cable (upwards/downwards compatible) | Patch cable | 2 RJ-45 plug | plug with bend protection mantle. High transmission speeds due to operating frequency with up to 250 MHz (in comparison to Cat.5/Cat.5e cable bandwidth of 100 MHz).	64	64
2021-11-08 13:37:35.346528	2021-11-08 13:37:35.34758	en	USB Cable	usb-cable	Solid conductors eliminate strand-interaction distortion and reduce jitter. As the surface is made of high-purity silver, the performance is very close to that of a solid silver cable, but priced much closer to solid copper cable.	65	65
2021-11-08 13:37:35.366121	2021-11-08 13:37:35.367214	en	Instant Camera	instant-camera	With its nostalgic design and simple point-and-shoot functionality, the Instant Camera is the perfect pick to get started with instant photography.	66	66
2021-11-08 13:37:35.384687	2021-11-08 13:37:35.385742	en	Camera Lens	camera-lens	This lens is a Di type lens using an optical system with improved multi-coating designed to function with digital SLR cameras as well as film cameras.	67	67
2021-11-08 13:37:35.407023	2021-11-08 13:37:35.408117	en	Vintage Folding Camera	vintage-folding-camera	This vintage folding camera is so antiquated that you cannot possibly hope to produce actual photographs with it. However, it makes a wonderful decorative piece for the home or office.	68	68
2021-11-08 13:37:35.423216	2021-11-08 13:37:35.424412	en	Tripod	tripod	Capture vivid, professional-style photographs with help from this lightweight tripod. The adjustable-height tripod makes it easy to achieve reliable stability and score just the right angle when going after that award-winning shot.	69	69
2021-11-08 13:37:35.441807	2021-11-08 13:37:35.442867	en	Instamatic Camera	instamatic-camera	This inexpensive point-and-shoot camera uses easy-to-load 126 film cartridges. A built-in flash unit ensure great results, no matter the lighting conditions.	70	70
2021-11-08 13:37:35.461947	2021-11-08 13:37:35.463011	en	Compact Digital Camera	compact-digital-camera	Unleash your creative potential with high-level performance and advanced features such as AI-powered Real-time Eye AF; new, high-precision Real-time Tracking; high-speed continuous shooting and 4K HDR movie-shooting. The camera's innovative AF quickly and reliably detects the position of the subject and then tracks the subject's motion, keeping it in sharp focus.	71	71
2021-11-08 13:37:35.486322	2021-11-08 13:37:35.487745	en	Nikkormat SLR Camera	nikkormat-slr-camera	The Nikkormat FS was brought to market by Nikon in 1965. The lens is a 50mm f1.4 Nikkor. Nice glass, smooth focus and a working diaphragm. A UV filter and a Nikon front lens cap are included with the lens.	72	72
2021-11-08 13:37:35.503032	2021-11-08 13:37:35.504617	en	Compact SLR Camera	compact-slr-camera	Retro styled, portable in size and built around a powerful 24-megapixel APS-C CMOS sensor, this digital camera is the ideal companion for creative everyday photography. Packed full of high spec features such as an advanced hybrid autofocus system able to keep pace with even the most active subjects, a speedy 6fps continuous-shooting mode, high-resolution electronic viewfinder and intuitive swivelling touchscreen, it brings professional image making into everyoneΓÇÖs grasp.	73	73
2021-11-08 13:37:35.520991	2021-11-08 13:37:35.522304	en	Twin Lens Camera	twin-lens-camera	What makes a Rolleiflex TLR so special? Many things. To start, TLR stands for twin lens reflex. ΓÇ£TwinΓÇ¥ because there are two lenses. And reflex means that the photographer looks through the lens to view the reflected image of an object or scene on the focusing screen.	74	74
2021-11-08 13:37:35.537545	2021-11-08 13:37:35.538635	en	Road Bike	road-bike	Featuring a full carbon chassis - complete with cyclocross-specific carbon fork - and a component setup geared for hard use on the race circuit, it's got the low weight, exceptional efficiency and brilliant handling you'll need to stay at the front of the pack.	75	75
2021-11-08 13:37:35.557549	2021-11-08 13:37:35.558623	en	Skipping Rope	skipping-rope	When you're working out you need a quality rope that doesn't tangle at every couple of jumps and with this skipping rope you won't have this problem. The fact that it looks like a pair of tasty frankfurters is merely a bonus.	76	76
2021-11-08 13:37:35.573694	2021-11-08 13:37:35.574799	en	Boxing Gloves	boxing-gloves	Training gloves designed for optimum training. Our gloves promote proper punching technique because they are conformed to the natural shape of your fist. Dense, innovative two-layer foam provides better shock absorbency and full padding on the front, back and wrist to promote proper punching technique.	77	77
2021-11-08 13:37:35.592013	2021-11-08 13:37:35.59314	en	Tent	tent	With tons of space inside (for max. 4 persons), full head height throughout the entire tent and an unusual and striking shape, this tent offers you everything you need.	78	78
2021-11-08 13:37:35.611187	2021-11-08 13:37:35.612377	en	Cruiser Skateboard	cruiser-skateboard	Based on the 1970s iconic shape, but made to a larger 69cm size, with updated, quality component, these skateboards are great for beginners to learn the foot spacing required, and are perfect for all-day cruising.	79	79
2021-11-08 13:37:35.627235	2021-11-08 13:37:35.628151	en	Football	football	This football features high-contrast graphics for high-visibility during play, while its machine-stitched tpu casing offers consistent performance.	80	80
2021-11-08 13:37:35.641266	2021-11-08 13:37:35.642659	en	Tennis Ball	tennis-ball	Our dog loves these tennis balls and they last for some time before they eventually either get lost in some field or bush or the covering comes off due to it being used most of the day every day.	81	81
2021-11-08 13:37:35.656367	2021-11-08 13:37:35.657474	en	Basketball	basketball	The Wilson MVP ball is perfect for playing basketball, and improving your skill for hours on end. Designed for new players, it is created with a high-quality rubber suitable for courts, allowing you to get full use during your practices.	82	82
2021-11-08 13:37:35.677972	2021-11-08 13:37:35.679292	en	Ultraboost Running Shoe	ultraboost-running-shoe	With its ultra-light, uber-responsive magic foam and a carbon fiber plate that feels like itΓÇÖs propelling you forward, the Running Shoe is ready to push you to victories both large and small	83	83
2021-11-08 13:37:35.731196	2021-11-08 13:37:35.732316	en	Freerun Running Shoe	freerun-running-shoe	The Freerun Men's Running Shoe is built for record-breaking speed. The Flyknit upper delivers ultra-lightweight support that fits like a glove.	84	84
2021-11-08 13:37:35.805094	2021-11-08 13:37:35.807412	en	Hi-Top Basketball Shoe	hi-top-basketball-shoe	Boasting legendary performance since 2008, the Hyperdunkz Basketball Shoe needs no gimmicks to stand out. Air units deliver best-in-class cushioning, while a dynamic lacing system keeps your foot snug and secure, so you can focus on your game and nothing else.	85	85
2021-11-08 13:37:35.878583	2021-11-08 13:37:35.880289	en	Pureboost Running Shoe	pureboost-running-shoe	Built to handle curbs, corners and uneven sidewalks, these natural running shoes have an expanded landing zone and a heel plate for added stability. A lightweight and stretchy knit upper supports your native stride.	86	86
2021-11-08 13:37:35.933346	2021-11-08 13:37:35.934385	en	RunX Running Shoe	runx-running-shoe	These running shoes are made with an airy, lightweight mesh upper. The durable rubber outsole grips the pavement for added stability. A cushioned midsole brings comfort to each step.	87	87
2021-11-08 13:37:35.987052	2021-11-08 13:37:35.988147	en	Allstar Sneakers	allstar-sneakers	All Star is the most iconic sneaker in the world, recognised for its unmistakable silhouette, star-centred ankle patch and cultural authenticity. And like the best paradigms, it only gets better with time.	88	88
2021-11-08 13:37:36.076675	2021-11-08 13:37:36.077864	en	Spiky Cactus	spiky-cactus	A spiky yet elegant house cactus - perfect for the home or office. Origin and habitat: Probably native only to the Andes of Peru	89	89
2021-11-08 13:37:36.099342	2021-11-08 13:37:36.100445	en	Tulip Pot	tulip-pot	Bright crimson red species tulip with black centers, the poppy-like flowers will open up in full sun. Ideal for rock gardens, pots and border edging.	90	90
2021-11-08 13:37:36.119022	2021-11-08 13:37:36.120224	en	Hanging Plant	hanging-plant	Can be found in tropical and sub-tropical America where it grows on the branches of trees, but also on telephone wires and electricity cables and poles that sometimes topple with the weight of these plants. This plant loves a moist and warm air.	91	91
2021-11-08 13:37:36.135872	2021-11-08 13:37:36.137985	en	Aloe Vera	aloe-vera	Decorative Aloe vera makes a lovely house plant. A really trendy plant, Aloe vera is just so easy to care for. Aloe vera sap has been renowned for its remarkable medicinal and cosmetic properties for many centuries and has been used to treat grazes, insect bites and sunburn - it really works.	92	92
2021-11-08 13:37:36.153746	2021-11-08 13:37:36.154727	en	Fern Blechnum Gibbum	fern-blechnum-gibbum	Create a tropical feel in your home with this lush green tree fern, it has decorative leaves and will develop a short slender trunk in time.	93	93
2021-11-08 13:37:36.170656	2021-11-08 13:37:36.171674	en	Assorted Indoor Succulents	assorted-succulents	These assorted succulents come in a variety of different shapes and colours - each with their own unique personality. Succulents grow best in plenty of light: a sunny windowsill would be the ideal spot for them to thrive!	94	94
2021-11-08 13:37:36.19161	2021-11-08 13:37:36.19303	en	Orchid	orchid	Gloriously elegant. It can go along with any interior as it is a neutral color and the most popular Phalaenopsis overall. 2 to 3 foot stems host large white flowers that can last for over 2 months.	95	95
2021-11-08 13:37:36.210104	2021-11-08 13:37:36.210987	en	Bonsai Tree	bonsai-tree	Excellent semi-evergreen bonsai. Indoors or out but needs some winter protection. All trees sent will leave the nursery in excellent condition and will be of equal quality or better than the photograph shown.	96	96
2021-11-08 13:37:36.227109	2021-11-08 13:37:36.229121	en	Guardian Lion Statue	guardian-lion-statue	Placing it at home or office can bring you fortune and prosperity, guard your house and ward off ill fortune.	97	97
2021-11-08 13:37:36.253338	2021-11-08 13:37:36.25495	en	Hand Trowel	hand-trowel	Hand trowel for garden cultivating hammer finish epoxy-coated head for improved resistance to rust, scratches, humidity and alkalines in the soil.	98	98
2021-11-08 13:37:36.273298	2021-11-08 13:37:36.274577	en	Balloon Chair	balloon-chair	A charming vintage white wooden chair featuring an extremely spherical pink balloon. The balloon may be detached and used for other purposes, for example as a party decoration.	99	99
2021-11-08 13:37:36.291106	2021-11-08 13:37:36.292254	en	Grey Fabric Sofa	grey-fabric-sofa	Seat cushions filled with high resilience foam and polyester fibre wadding give comfortable support for your body, and easily regain their shape when you get up. The cover is easy to keep clean as it is removable and can be machine washed.	100	100
2021-11-08 13:37:36.307474	2021-11-08 13:37:36.308465	en	Leather Sofa	leather-sofa	This premium, tan-brown bonded leather seat is part of the 'chill' sofa range. The lever activated recline feature makes it easy to adjust to any position. This smart, bustle back design with rounded tight padded arms has been designed with your comfort in mind. This well-padded chair has foam pocket sprung seat cushions and fibre-filled back cushions.	101	101
2021-11-08 13:37:36.324502	2021-11-08 13:37:36.325573	en	Light Shade	light-shade	Modern tapered white polycotton pendant shade with a metallic silver chrome interior finish for maximum light reflection. Reversible gimble so it can be used as a ceiling shade or as a lamp shade.	102	102
2021-11-08 13:37:36.34003	2021-11-08 13:37:36.341096	en	Wooden Side Desk	wooden-side-desk	Drawer stops prevent the drawers from being pulled out too far. Built-in cable management for collecting cables and cords; out of sight but close at hand.	103	103
2021-11-08 13:37:36.35684	2021-11-08 13:37:36.357738	en	Comfy Padded Chair	comfy-padded-chair	You sit comfortably thanks to the shaped back. The chair frame is made of solid wood, which is a durable natural material.	104	104
2021-11-08 13:37:36.373401	2021-11-08 13:37:36.374406	en	Black Eaves Chair	black-eaves-chair	Comfortable to sit on thanks to the bowl-shaped seat and rounded shape of the backrest. No tools are required to assemble the chair, you just click it together with a simple mechanism under the seat.	105	105
2021-11-08 13:37:36.388883	2021-11-08 13:37:36.389759	en	Wooden Stool	wooden-stool	Solid wood is a hardwearing natural material, which can be sanded and surface treated as required.	106	106
2021-11-08 13:37:36.404418	2021-11-08 13:37:36.405255	en	Bedside Table	bedside-table	Every table is unique, with varying grain pattern and natural colour shifts that are part of the charm of wood.	107	107
2021-11-08 13:37:36.420169	2021-11-08 13:37:36.421491	en	Modern Cafe Chair	modern-cafe-chair	You sit comfortably thanks to the restful flexibility of the seat. Lightweight and easy to move around, yet stable enough even for the liveliest, young family members.	108	108
\.


--
-- Data for Name: product_variant; Type: TABLE DATA; Schema: public; Owner: ghienan
--

COPY public.product_variant ("createdAt", "updatedAt", "deletedAt", enabled, sku, "stockOnHand", "stockAllocated", "outOfStockThreshold", "useGlobalOutOfStockThreshold", "trackInventory", id, "productId", "featuredAssetId", "taxCategoryId") FROM stdin;
2021-10-15 15:12:31.153519	2021-10-15 15:12:31.153519	\N	t	L2201308	100	0	0	t	INHERIT	1	1	\N	1
2021-10-15 15:12:31.168734	2021-10-15 15:12:31.168734	\N	t	L2201508	100	0	0	t	INHERIT	2	1	\N	1
2021-10-15 15:12:31.176866	2021-10-15 15:12:31.176866	\N	t	L2201316	100	0	0	t	INHERIT	3	1	\N	1
2021-10-15 15:12:31.184605	2021-10-15 15:12:31.184605	\N	t	L2201516	100	0	0	t	INHERIT	4	1	\N	1
2021-10-15 15:12:31.213154	2021-10-15 15:12:31.213154	\N	t	TBL200032	100	0	0	t	INHERIT	5	2	\N	1
2021-10-15 15:12:31.222088	2021-10-15 15:12:31.222088	\N	t	TBL200128	100	0	0	t	INHERIT	6	2	\N	1
2021-10-15 15:12:31.245946	2021-10-15 15:12:31.245946	\N	t	834444	100	0	0	t	INHERIT	7	3	\N	1
2021-10-15 15:12:31.269936	2021-10-15 15:12:31.269936	\N	t	LU32J590UQUXEN	100	0	0	t	INHERIT	8	4	\N	1
2021-10-15 15:12:31.299802	2021-10-15 15:12:31.299802	\N	t	C24F390	100	0	0	t	INHERIT	9	5	\N	1
2021-10-15 15:12:31.306432	2021-10-15 15:12:31.306432	\N	t	C27F390	100	0	0	t	INHERIT	10	5	\N	1
2021-10-15 15:12:31.340926	2021-10-15 15:12:31.340926	\N	t	CMK32GX4M2AC04	100	0	0	t	INHERIT	11	6	\N	1
2021-10-15 15:12:31.347485	2021-10-15 15:12:31.347485	\N	t	CMK32GX4M2AC08	100	0	0	t	INHERIT	12	6	\N	1
2021-10-15 15:12:31.354879	2021-10-15 15:12:31.354879	\N	t	CMK32GX4M2AC16	100	0	0	t	INHERIT	13	6	\N	1
2021-10-15 15:12:31.402008	2021-10-15 15:12:31.402008	\N	t	CGS480VR1063	100	0	0	t	INHERIT	14	7	\N	1
2021-10-15 15:12:31.407514	2021-10-15 15:12:31.407514	\N	t	CGS480VR1064	100	0	0	t	INHERIT	15	7	\N	1
2021-10-15 15:12:31.414439	2021-10-15 15:12:31.414439	\N	t	CGS480VR1065	100	0	0	t	INHERIT	16	7	\N	1
2021-10-15 15:12:31.42047	2021-10-15 15:12:31.42047	\N	t	CGS480VR1066	100	0	0	t	INHERIT	17	7	\N	1
2021-10-15 15:12:31.464609	2021-10-15 15:12:31.464609	\N	t	IHD455T1	100	0	0	t	INHERIT	18	8	\N	1
2021-10-15 15:12:31.47012	2021-10-15 15:12:31.47012	\N	t	IHD455T2	100	0	0	t	INHERIT	19	8	\N	1
2021-10-15 15:12:31.47543	2021-10-15 15:12:31.47543	\N	t	IHD455T3	100	0	0	t	INHERIT	20	8	\N	1
2021-10-15 15:12:31.484463	2021-10-15 15:12:31.484463	\N	t	IHD455T4	100	0	0	t	INHERIT	21	8	\N	1
2021-10-15 15:12:31.491093	2021-10-15 15:12:31.491093	\N	t	IHD455T6	100	0	0	t	INHERIT	22	8	\N	1
2021-10-15 15:12:31.507881	2021-10-15 15:12:31.507881	\N	t	A4TKLA45535	100	0	0	t	INHERIT	23	9	\N	1
2021-10-15 15:12:31.52383	2021-10-15 15:12:31.52383	\N	t	A23334x30	100	0	0	t	INHERIT	24	10	\N	1
2021-10-15 15:12:31.540195	2021-10-15 15:12:31.540195	\N	t	USBCIN01.5MI	100	0	0	t	INHERIT	25	11	\N	1
2021-10-15 15:12:31.567085	2021-10-15 15:12:31.567085	\N	t	IC22MWDD	100	0	0	t	INHERIT	26	12	\N	1
2021-10-15 15:12:31.591367	2021-10-15 15:12:31.591367	\N	t	B0012UUP02	100	0	0	t	INHERIT	27	13	\N	1
2021-10-15 15:12:31.611308	2021-10-15 15:12:31.611308	\N	t	B00AFC9099	100	0	0	t	INHERIT	28	14	\N	1
2021-10-15 15:12:31.632145	2021-10-15 15:12:31.632145	\N	t	B00XI87KV8	100	0	0	t	INHERIT	29	15	\N	1
2021-10-15 15:12:31.653312	2021-10-15 15:12:31.653312	\N	t	B07K1330LL	100	0	0	t	INHERIT	30	16	\N	1
2021-10-15 15:12:31.675681	2021-10-15 15:12:31.675681	\N	t	B07D990021	100	0	0	t	INHERIT	31	17	\N	1
2021-10-15 15:12:31.693553	2021-10-15 15:12:31.693553	\N	t	B07D33B334	100	0	0	t	INHERIT	32	18	\N	1
2021-10-15 15:12:31.711012	2021-10-15 15:12:31.711012	\N	t	B07D75V44S	100	0	0	t	INHERIT	33	19	\N	1
2021-10-15 15:12:31.730406	2021-10-15 15:12:31.730406	\N	t	B07D78JTLR	100	0	0	t	INHERIT	34	20	\N	1
2021-10-15 15:12:31.763071	2021-10-15 15:12:31.763071	\N	t	RB000844334	100	0	0	t	INHERIT	35	21	\N	1
2021-10-15 15:12:31.785727	2021-10-15 15:12:31.785727	\N	t	B07CNGXVXT	100	0	0	t	INHERIT	36	22	\N	1
2021-10-15 15:12:31.802717	2021-10-15 15:12:31.802717	\N	t	B000ZYLPPU	100	0	0	t	INHERIT	37	23	\N	1
2021-10-15 15:12:31.820211	2021-10-15 15:12:31.820211	\N	t	2000023510	100	0	0	t	INHERIT	38	24	\N	1
2021-10-15 15:12:31.848735	2021-10-15 15:12:31.848735	\N	t	799872520	100	0	0	t	INHERIT	39	25	\N	1
2021-10-15 15:12:31.878263	2021-10-15 15:12:31.878263	\N	t	SC3137-056	100	0	0	t	INHERIT	40	26	\N	1
2021-10-15 15:12:31.902052	2021-10-15 15:12:31.902052	\N	t	WRT11752P	100	0	0	t	INHERIT	41	27	\N	1
2021-10-15 15:12:31.918566	2021-10-15 15:12:31.918566	\N	t	WTB1418XB06	100	0	0	t	INHERIT	42	28	\N	1
2021-10-15 15:12:31.987516	2021-10-15 15:12:31.987516	\N	t	RS0040	100	0	0	t	INHERIT	43	29	\N	1
2021-10-15 15:12:31.994115	2021-10-15 15:12:31.994115	\N	t	RS0042	100	0	0	t	INHERIT	44	29	\N	1
2021-10-15 15:12:32.000572	2021-10-15 15:12:32.000572	\N	t	RS0044	100	0	0	t	INHERIT	45	29	\N	1
2021-10-15 15:12:32.007557	2021-10-15 15:12:32.007557	\N	t	RS0046	100	0	0	t	INHERIT	46	29	\N	1
2021-10-15 15:12:32.045304	2021-10-15 15:12:32.045304	\N	t	AR4561-40	100	0	0	t	INHERIT	47	30	\N	1
2021-10-15 15:12:32.051939	2021-10-15 15:12:32.051939	\N	t	AR4561-42	100	0	0	t	INHERIT	48	30	\N	1
2021-10-15 15:12:32.057207	2021-10-15 15:12:32.057207	\N	t	AR4561-44	100	0	0	t	INHERIT	49	30	\N	1
2021-10-15 15:12:32.062486	2021-10-15 15:12:32.062486	\N	t	AR4561-46	100	0	0	t	INHERIT	50	30	\N	1
2021-10-15 15:12:32.103855	2021-10-15 15:12:32.103855	\N	t	AO7893-40	100	0	0	t	INHERIT	51	31	\N	1
2021-10-15 15:12:32.110776	2021-10-15 15:12:32.110776	\N	t	AO7893-42	100	0	0	t	INHERIT	52	31	\N	1
2021-10-15 15:12:32.118545	2021-10-15 15:12:32.118545	\N	t	AO7893-44	100	0	0	t	INHERIT	53	31	\N	1
2021-10-15 15:12:32.124661	2021-10-15 15:12:32.124661	\N	t	AO7893-46	100	0	0	t	INHERIT	54	31	\N	1
2021-10-15 15:12:32.154666	2021-10-15 15:12:32.154666	\N	t	F3578640	100	0	0	t	INHERIT	55	32	\N	1
2021-10-15 15:12:32.161372	2021-10-15 15:12:32.161372	\N	t	F3578642	100	0	0	t	INHERIT	56	32	\N	1
2021-10-15 15:12:32.168751	2021-10-15 15:12:32.168751	\N	t	F3578644	100	0	0	t	INHERIT	57	32	\N	1
2021-10-15 15:12:32.174715	2021-10-15 15:12:32.174715	\N	t	F3578646	100	0	0	t	INHERIT	58	32	\N	1
2021-10-15 15:12:32.205287	2021-10-15 15:12:32.205287	\N	t	F3633340	100	0	0	t	INHERIT	59	33	\N	1
2021-10-15 15:12:32.210382	2021-10-15 15:12:32.210382	\N	t	F3633342	100	0	0	t	INHERIT	60	33	\N	1
2021-10-15 15:12:32.215852	2021-10-15 15:12:32.215852	\N	t	F3633344	100	0	0	t	INHERIT	61	33	\N	1
2021-10-15 15:12:32.221155	2021-10-15 15:12:32.221155	\N	t	F3633346	100	0	0	t	INHERIT	62	33	\N	1
2021-10-15 15:12:32.287389	2021-10-15 15:12:32.287389	\N	t	CAS23340	100	0	0	t	INHERIT	63	34	\N	1
2021-10-15 15:12:32.299375	2021-10-15 15:12:32.299375	\N	t	CAS23342	100	0	0	t	INHERIT	64	34	\N	1
2021-10-15 15:12:32.30642	2021-10-15 15:12:32.30642	\N	t	CAS23344	100	0	0	t	INHERIT	65	34	\N	1
2021-10-15 15:12:32.314487	2021-10-15 15:12:32.314487	\N	t	CAS23346	100	0	0	t	INHERIT	66	34	\N	1
2021-10-15 15:12:32.361252	2021-10-15 15:12:32.361252	\N	t	SC011001	100	0	0	t	INHERIT	67	35	\N	1
2021-10-15 15:12:32.38427	2021-10-15 15:12:32.38427	\N	t	A58477	100	0	0	t	INHERIT	68	36	\N	1
2021-10-15 15:12:32.401732	2021-10-15 15:12:32.401732	\N	t	A44223	100	0	0	t	INHERIT	69	37	\N	1
2021-10-15 15:12:32.418521	2021-10-15 15:12:32.418521	\N	t	A44352	100	0	0	t	INHERIT	70	38	\N	1
2021-10-15 15:12:32.43533	2021-10-15 15:12:32.43533	\N	t	A04851	100	0	0	t	INHERIT	71	39	\N	1
2021-10-15 15:12:32.451605	2021-10-15 15:12:32.451605	\N	t	A08593	100	0	0	t	INHERIT	72	40	\N	1
2021-10-15 15:12:32.466295	2021-10-15 15:12:32.466295	\N	t	ROR00221	100	0	0	t	INHERIT	73	41	\N	1
2021-10-15 15:12:32.481058	2021-10-15 15:12:32.481058	\N	t	B01MXFLUSV	100	0	0	t	INHERIT	74	42	\N	1
2021-10-15 15:12:32.510208	2021-10-15 15:12:32.510208	\N	t	GL34LLW11	100	0	0	t	INHERIT	75	43	\N	1
2021-10-15 15:12:32.545892	2021-10-15 15:12:32.545892	\N	t	4058NB/09	100	0	0	t	INHERIT	76	44	\N	1
2021-10-15 15:12:32.593667	2021-10-15 15:12:32.593667	\N	t	34-BC82444	100	0	0	t	INHERIT	77	45	\N	1
2021-10-15 15:12:32.611463	2021-10-15 15:12:32.611463	\N	t	CH00001-12	100	0	0	t	INHERIT	78	46	\N	1
2021-10-15 15:12:32.635178	2021-10-15 15:12:32.635178	\N	t	CH00001-02	100	0	0	t	INHERIT	79	47	\N	1
2021-10-15 15:12:32.652384	2021-10-15 15:12:32.652384	\N	t	B45809LSW	100	0	0	t	INHERIT	80	48	\N	1
2021-10-15 15:12:32.675746	2021-10-15 15:12:32.675746	\N	t	304.096.29	100	0	0	t	INHERIT	81	49	\N	1
2021-10-15 15:12:32.695673	2021-10-15 15:12:32.695673	\N	t	404.068.14	100	0	0	t	INHERIT	82	50	\N	1
2021-10-15 15:12:32.714338	2021-10-15 15:12:32.714338	\N	t	003.600.02	100	0	0	t	INHERIT	83	51	\N	1
2021-10-15 15:12:32.731298	2021-10-15 15:12:32.731298	\N	t	202.493.30	100	0	0	t	INHERIT	84	52	\N	1
2021-10-15 15:12:32.749349	2021-10-15 15:12:32.749349	\N	t	404.290.14	100	0	0	t	INHERIT	85	53	\N	1
2021-10-15 15:12:32.784643	2021-10-15 15:12:32.784643	\N	t	404.038.96	100	0	0	t	INHERIT	86	54	\N	1
2021-10-15 15:12:32.798656	2021-10-15 15:12:32.798656	\N	t	404.038.96	100	0	0	t	INHERIT	87	54	\N	1
2021-10-15 15:12:32.805003	2021-10-15 15:12:32.805003	\N	t	404.038.96	100	0	0	t	INHERIT	88	54	\N	1
2021-11-08 13:37:34.91028	2021-11-08 13:37:34.91028	\N	t	L2201308	100	0	0	t	INHERIT	89	55	\N	1
2021-11-08 13:37:34.945374	2021-11-08 13:37:34.945374	\N	t	L2201508	100	0	0	t	INHERIT	90	55	\N	1
2021-11-08 13:37:34.953984	2021-11-08 13:37:34.953984	\N	t	L2201316	100	0	0	t	INHERIT	91	55	\N	1
2021-11-08 13:37:34.961902	2021-11-08 13:37:34.961902	\N	t	L2201516	100	0	0	t	INHERIT	92	55	\N	1
2021-11-08 13:37:34.994412	2021-11-08 13:37:34.994412	\N	t	TBL200032	100	0	0	t	INHERIT	93	56	\N	1
2021-11-08 13:37:35.004667	2021-11-08 13:37:35.004667	\N	t	TBL200128	100	0	0	t	INHERIT	94	56	\N	1
2021-11-08 13:37:35.026648	2021-11-08 13:37:35.026648	\N	t	834444	100	0	0	t	INHERIT	95	57	\N	1
2021-11-08 13:37:35.047872	2021-11-08 13:37:35.047872	\N	t	LU32J590UQUXEN	100	0	0	t	INHERIT	96	58	\N	1
2021-11-08 13:37:35.083698	2021-11-08 13:37:35.083698	\N	t	C24F390	100	0	0	t	INHERIT	97	59	\N	1
2021-11-08 13:37:35.092812	2021-11-08 13:37:35.092812	\N	t	C27F390	100	0	0	t	INHERIT	98	59	\N	1
2021-11-08 13:37:35.132372	2021-11-08 13:37:35.132372	\N	t	CMK32GX4M2AC04	100	0	0	t	INHERIT	99	60	\N	1
2021-11-08 13:37:35.139912	2021-11-08 13:37:35.139912	\N	t	CMK32GX4M2AC08	100	0	0	t	INHERIT	100	60	\N	1
2021-11-08 13:37:35.146507	2021-11-08 13:37:35.146507	\N	t	CMK32GX4M2AC16	100	0	0	t	INHERIT	101	60	\N	1
2021-11-08 13:37:35.194418	2021-11-08 13:37:35.194418	\N	t	CGS480VR1063	100	0	0	t	INHERIT	102	61	\N	1
2021-11-08 13:37:35.201901	2021-11-08 13:37:35.201901	\N	t	CGS480VR1064	100	0	0	t	INHERIT	103	61	\N	1
2021-11-08 13:37:35.21263	2021-11-08 13:37:35.21263	\N	t	CGS480VR1065	100	0	0	t	INHERIT	104	61	\N	1
2021-11-08 13:37:35.220429	2021-11-08 13:37:35.220429	\N	t	CGS480VR1066	100	0	0	t	INHERIT	105	61	\N	1
2021-11-08 13:37:35.269213	2021-11-08 13:37:35.269213	\N	t	IHD455T1	100	0	0	t	INHERIT	106	62	\N	1
2021-11-08 13:37:35.276289	2021-11-08 13:37:35.276289	\N	t	IHD455T2	100	0	0	t	INHERIT	107	62	\N	1
2021-11-08 13:37:35.282026	2021-11-08 13:37:35.282026	\N	t	IHD455T3	100	0	0	t	INHERIT	108	62	\N	1
2021-11-08 13:37:35.289766	2021-11-08 13:37:35.289766	\N	t	IHD455T4	100	0	0	t	INHERIT	109	62	\N	1
2021-11-08 13:37:35.295496	2021-11-08 13:37:35.295496	\N	t	IHD455T6	100	0	0	t	INHERIT	110	62	\N	1
2021-11-08 13:37:35.315397	2021-11-08 13:37:35.315397	\N	t	A4TKLA45535	100	0	0	t	INHERIT	111	63	\N	1
2021-11-08 13:37:35.335007	2021-11-08 13:37:35.335007	\N	t	A23334x30	100	0	0	t	INHERIT	112	64	\N	1
2021-11-08 13:37:35.353344	2021-11-08 13:37:35.353344	\N	t	USBCIN01.5MI	100	0	0	t	INHERIT	113	65	\N	1
2021-11-08 13:37:35.374069	2021-11-08 13:37:35.374069	\N	t	IC22MWDD	100	0	0	t	INHERIT	114	66	\N	1
2021-11-08 13:37:35.394039	2021-11-08 13:37:35.394039	\N	t	B0012UUP02	100	0	0	t	INHERIT	115	67	\N	1
2021-11-08 13:37:35.412425	2021-11-08 13:37:35.412425	\N	t	B00AFC9099	100	0	0	t	INHERIT	116	68	\N	1
2021-11-08 13:37:35.428839	2021-11-08 13:37:35.428839	\N	t	B00XI87KV8	100	0	0	t	INHERIT	117	69	\N	1
2021-11-08 13:37:35.448937	2021-11-08 13:37:35.448937	\N	t	B07K1330LL	100	0	0	t	INHERIT	118	70	\N	1
2021-11-08 13:37:35.473218	2021-11-08 13:37:35.473218	\N	t	B07D990021	100	0	0	t	INHERIT	119	71	\N	1
2021-11-08 13:37:35.492293	2021-11-08 13:37:35.492293	\N	t	B07D33B334	100	0	0	t	INHERIT	120	72	\N	1
2021-11-08 13:37:35.509848	2021-11-08 13:37:35.509848	\N	t	B07D75V44S	100	0	0	t	INHERIT	121	73	\N	1
2021-11-08 13:37:35.527502	2021-11-08 13:37:35.527502	\N	t	B07D78JTLR	100	0	0	t	INHERIT	122	74	\N	1
2021-11-08 13:37:35.546079	2021-11-08 13:37:35.546079	\N	t	RB000844334	100	0	0	t	INHERIT	123	75	\N	1
2021-11-08 13:37:35.562945	2021-11-08 13:37:35.562945	\N	t	B07CNGXVXT	100	0	0	t	INHERIT	124	76	\N	1
2021-11-08 13:37:35.579108	2021-11-08 13:37:35.579108	\N	t	B000ZYLPPU	100	0	0	t	INHERIT	125	77	\N	1
2021-11-08 13:37:35.599435	2021-11-08 13:37:35.599435	\N	t	2000023510	100	0	0	t	INHERIT	126	78	\N	1
2021-11-08 13:37:35.616697	2021-11-08 13:37:35.616697	\N	t	799872520	100	0	0	t	INHERIT	127	79	\N	1
2021-11-08 13:37:35.632435	2021-11-08 13:37:35.632435	\N	t	SC3137-056	100	0	0	t	INHERIT	128	80	\N	1
2021-11-08 13:37:35.646782	2021-11-08 13:37:35.646782	\N	t	WRT11752P	100	0	0	t	INHERIT	129	81	\N	1
2021-11-08 13:37:35.661514	2021-11-08 13:37:35.661514	\N	t	WTB1418XB06	100	0	0	t	INHERIT	130	82	\N	1
2021-11-08 13:37:35.700524	2021-11-08 13:37:35.700524	\N	t	RS0040	100	0	0	t	INHERIT	131	83	\N	1
2021-11-08 13:37:35.707396	2021-11-08 13:37:35.707396	\N	t	RS0042	100	0	0	t	INHERIT	132	83	\N	1
2021-11-08 13:37:35.713436	2021-11-08 13:37:35.713436	\N	t	RS0044	100	0	0	t	INHERIT	133	83	\N	1
2021-11-08 13:37:35.719913	2021-11-08 13:37:35.719913	\N	t	RS0046	100	0	0	t	INHERIT	134	83	\N	1
2021-11-08 13:37:35.752551	2021-11-08 13:37:35.752551	\N	t	AR4561-40	100	0	0	t	INHERIT	135	84	\N	1
2021-11-08 13:37:35.758985	2021-11-08 13:37:35.758985	\N	t	AR4561-42	100	0	0	t	INHERIT	136	84	\N	1
2021-11-08 13:37:35.766356	2021-11-08 13:37:35.766356	\N	t	AR4561-44	100	0	0	t	INHERIT	137	84	\N	1
2021-11-08 13:37:35.781052	2021-11-08 13:37:35.781052	\N	t	AR4561-46	100	0	0	t	INHERIT	138	84	\N	1
2021-11-08 13:37:35.837389	2021-11-08 13:37:35.837389	\N	t	AO7893-40	100	0	0	t	INHERIT	139	85	\N	1
2021-11-08 13:37:35.850488	2021-11-08 13:37:35.850488	\N	t	AO7893-42	100	0	0	t	INHERIT	140	85	\N	1
2021-11-08 13:37:35.856599	2021-11-08 13:37:35.856599	\N	t	AO7893-44	100	0	0	t	INHERIT	141	85	\N	1
2021-11-08 13:37:35.863852	2021-11-08 13:37:35.863852	\N	t	AO7893-46	100	0	0	t	INHERIT	142	85	\N	1
2021-11-08 13:37:35.900951	2021-11-08 13:37:35.900951	\N	t	F3578640	100	0	0	t	INHERIT	143	86	\N	1
2021-11-08 13:37:35.909032	2021-11-08 13:37:35.909032	\N	t	F3578642	100	0	0	t	INHERIT	144	86	\N	1
2021-11-08 13:37:35.916664	2021-11-08 13:37:35.916664	\N	t	F3578644	100	0	0	t	INHERIT	145	86	\N	1
2021-11-08 13:37:35.922866	2021-11-08 13:37:35.922866	\N	t	F3578646	100	0	0	t	INHERIT	146	86	\N	1
2021-11-08 13:37:35.954525	2021-11-08 13:37:35.954525	\N	t	F3633340	100	0	0	t	INHERIT	147	87	\N	1
2021-11-08 13:37:35.959936	2021-11-08 13:37:35.959936	\N	t	F3633342	100	0	0	t	INHERIT	148	87	\N	1
2021-11-08 13:37:35.965279	2021-11-08 13:37:35.965279	\N	t	F3633344	100	0	0	t	INHERIT	149	87	\N	1
2021-11-08 13:37:35.973756	2021-11-08 13:37:35.973756	\N	t	F3633346	100	0	0	t	INHERIT	150	87	\N	1
2021-11-08 13:37:36.009576	2021-11-08 13:37:36.009576	\N	t	CAS23340	100	0	0	t	INHERIT	151	88	\N	1
2021-11-08 13:37:36.015059	2021-11-08 13:37:36.015059	\N	t	CAS23342	100	0	0	t	INHERIT	152	88	\N	1
2021-11-08 13:37:36.022254	2021-11-08 13:37:36.022254	\N	t	CAS23344	100	0	0	t	INHERIT	153	88	\N	1
2021-11-08 13:37:36.029193	2021-11-08 13:37:36.029193	\N	t	CAS23346	100	0	0	t	INHERIT	154	88	\N	1
2021-11-08 13:37:36.083146	2021-11-08 13:37:36.083146	\N	t	SC011001	100	0	0	t	INHERIT	155	89	\N	1
2021-11-08 13:37:36.106413	2021-11-08 13:37:36.106413	\N	t	A58477	100	0	0	t	INHERIT	156	90	\N	1
2021-11-08 13:37:36.125602	2021-11-08 13:37:36.125602	\N	t	A44223	100	0	0	t	INHERIT	157	91	\N	1
2021-11-08 13:37:36.143146	2021-11-08 13:37:36.143146	\N	t	A44352	100	0	0	t	INHERIT	158	92	\N	1
2021-11-08 13:37:36.159631	2021-11-08 13:37:36.159631	\N	t	A04851	100	0	0	t	INHERIT	159	93	\N	1
2021-11-08 13:37:36.179284	2021-11-08 13:37:36.179284	\N	t	A08593	100	0	0	t	INHERIT	160	94	\N	1
2021-11-08 13:37:36.199872	2021-11-08 13:37:36.199872	\N	t	ROR00221	100	0	0	t	INHERIT	161	95	\N	1
2021-11-08 13:37:36.214987	2021-11-08 13:37:36.214987	\N	t	B01MXFLUSV	100	0	0	t	INHERIT	162	96	\N	1
2021-11-08 13:37:36.23529	2021-11-08 13:37:36.23529	\N	t	GL34LLW11	100	0	0	t	INHERIT	163	97	\N	1
2021-11-08 13:37:36.261353	2021-11-08 13:37:36.261353	\N	t	4058NB/09	100	0	0	t	INHERIT	164	98	\N	1
2021-11-08 13:37:36.279516	2021-11-08 13:37:36.279516	\N	t	34-BC82444	100	0	0	t	INHERIT	165	99	\N	1
2021-11-08 13:37:36.296455	2021-11-08 13:37:36.296455	\N	t	CH00001-12	100	0	0	t	INHERIT	166	100	\N	1
2021-11-08 13:37:36.312722	2021-11-08 13:37:36.312722	\N	t	CH00001-02	100	0	0	t	INHERIT	167	101	\N	1
2021-11-08 13:37:36.329857	2021-11-08 13:37:36.329857	\N	t	B45809LSW	100	0	0	t	INHERIT	168	102	\N	1
2021-11-08 13:37:36.346188	2021-11-08 13:37:36.346188	\N	t	304.096.29	100	0	0	t	INHERIT	169	103	\N	1
2021-11-08 13:37:36.36231	2021-11-08 13:37:36.36231	\N	t	404.068.14	100	0	0	t	INHERIT	170	104	\N	1
2021-11-08 13:37:36.380048	2021-11-08 13:37:36.380048	\N	t	003.600.02	100	0	0	t	INHERIT	171	105	\N	1
2021-11-08 13:37:36.394041	2021-11-08 13:37:36.394041	\N	t	202.493.30	100	0	0	t	INHERIT	172	106	\N	1
2021-11-08 13:37:36.410276	2021-11-08 13:37:36.410276	\N	t	404.290.14	100	0	0	t	INHERIT	173	107	\N	1
2021-11-08 13:37:36.437796	2021-11-08 13:37:36.437796	\N	t	404.038.96	100	0	0	t	INHERIT	174	108	\N	1
2021-11-08 13:37:36.449312	2021-11-08 13:37:36.449312	\N	t	404.038.96	100	0	0	t	INHERIT	175	108	\N	1
2021-11-08 13:37:36.457392	2021-11-08 13:37:36.457392	\N	t	404.038.96	100	0	0	t	INHERIT	176	108	\N	1
\.


--
-- Data for Name: product_variant_asset; Type: TABLE DATA; Schema: public; Owner: ghienan
--

COPY public.product_variant_asset ("createdAt", "updatedAt", "assetId", "position", "productVariantId", id) FROM stdin;
\.


--
-- Data for Name: product_variant_channels_channel; Type: TABLE DATA; Schema: public; Owner: ghienan
--

COPY public.product_variant_channels_channel ("productVariantId", "channelId") FROM stdin;
1	1
2	1
3	1
4	1
5	1
6	1
7	1
8	1
9	1
10	1
11	1
12	1
13	1
14	1
15	1
16	1
17	1
18	1
19	1
20	1
21	1
22	1
23	1
24	1
25	1
26	1
27	1
28	1
29	1
30	1
31	1
32	1
33	1
34	1
35	1
36	1
37	1
38	1
39	1
40	1
41	1
42	1
43	1
44	1
45	1
46	1
47	1
48	1
49	1
50	1
51	1
52	1
53	1
54	1
55	1
56	1
57	1
58	1
59	1
60	1
61	1
62	1
63	1
64	1
65	1
66	1
67	1
68	1
69	1
70	1
71	1
72	1
73	1
74	1
75	1
76	1
77	1
78	1
79	1
80	1
81	1
82	1
83	1
84	1
85	1
86	1
87	1
88	1
89	1
90	1
91	1
92	1
93	1
94	1
95	1
96	1
97	1
98	1
99	1
100	1
101	1
102	1
103	1
104	1
105	1
106	1
107	1
108	1
109	1
110	1
111	1
112	1
113	1
114	1
115	1
116	1
117	1
118	1
119	1
120	1
121	1
122	1
123	1
124	1
125	1
126	1
127	1
128	1
129	1
130	1
131	1
132	1
133	1
134	1
135	1
136	1
137	1
138	1
139	1
140	1
141	1
142	1
143	1
144	1
145	1
146	1
147	1
148	1
149	1
150	1
151	1
152	1
153	1
154	1
155	1
156	1
157	1
158	1
159	1
160	1
161	1
162	1
163	1
164	1
165	1
166	1
167	1
168	1
169	1
170	1
171	1
172	1
173	1
174	1
175	1
176	1
\.


--
-- Data for Name: product_variant_facet_values_facet_value; Type: TABLE DATA; Schema: public; Owner: ghienan
--

COPY public.product_variant_facet_values_facet_value ("productVariantId", "facetValueId") FROM stdin;
86	38
87	39
88	28
174	38
175	39
176	28
\.


--
-- Data for Name: product_variant_options_product_option; Type: TABLE DATA; Schema: public; Owner: ghienan
--

COPY public.product_variant_options_product_option ("productVariantId", "productOptionId") FROM stdin;
1	1
1	3
2	2
2	3
3	1
3	4
4	2
4	4
5	5
6	6
9	7
10	8
11	9
12	10
13	11
14	12
14	14
15	13
15	14
16	12
16	15
17	13
17	15
18	16
19	17
20	18
21	19
22	20
43	21
44	22
45	23
46	24
47	25
48	26
49	27
50	28
51	29
52	30
53	31
54	32
55	33
56	34
57	35
58	36
59	37
60	38
61	39
62	40
63	41
64	42
65	43
66	44
86	45
87	46
88	47
89	48
89	50
90	49
90	50
91	48
91	51
92	49
92	51
93	52
94	53
97	54
98	55
99	56
100	57
101	58
102	59
102	61
103	60
103	61
104	59
104	62
105	60
105	62
106	63
107	64
108	65
109	66
110	67
131	68
132	69
133	70
134	71
135	72
136	73
137	74
138	75
139	76
140	77
141	78
142	79
143	80
144	81
145	82
146	83
147	84
148	85
149	86
150	87
151	88
152	89
153	90
154	91
174	92
175	93
176	94
\.


--
-- Data for Name: product_variant_price; Type: TABLE DATA; Schema: public; Owner: ghienan
--

COPY public.product_variant_price ("createdAt", "updatedAt", price, id, "channelId", "variantId") FROM stdin;
2021-10-15 15:12:31.165188	2021-10-15 15:12:31.165188	129900	1	1	1
2021-10-15 15:12:31.173678	2021-10-15 15:12:31.173678	139900	2	1	2
2021-10-15 15:12:31.182182	2021-10-15 15:12:31.182182	219900	3	1	3
2021-10-15 15:12:31.188566	2021-10-15 15:12:31.188566	229900	4	1	4
2021-10-15 15:12:31.217883	2021-10-15 15:12:31.217883	32900	5	1	5
2021-10-15 15:12:31.226239	2021-10-15 15:12:31.226239	44500	6	1	6
2021-10-15 15:12:31.250003	2021-10-15 15:12:31.250003	1899	7	1	7
2021-10-15 15:12:31.273128	2021-10-15 15:12:31.273128	31000	8	1	8
2021-10-15 15:12:31.304315	2021-10-15 15:12:31.304315	14374	9	1	9
2021-10-15 15:12:31.309814	2021-10-15 15:12:31.309814	16994	10	1	10
2021-10-15 15:12:31.345021	2021-10-15 15:12:31.345021	13785	11	1	11
2021-10-15 15:12:31.351671	2021-10-15 15:12:31.351671	14639	12	1	12
2021-10-15 15:12:31.358734	2021-10-15 15:12:31.358734	28181	13	1	13
2021-10-15 15:12:31.405567	2021-10-15 15:12:31.405567	108720	14	1	14
2021-10-15 15:12:31.411197	2021-10-15 15:12:31.411197	109995	15	1	15
2021-10-15 15:12:31.418482	2021-10-15 15:12:31.418482	93120	16	1	16
2021-10-15 15:12:31.42729	2021-10-15 15:12:31.42729	94920	17	1	17
2021-10-15 15:12:31.468237	2021-10-15 15:12:31.468237	3799	18	1	18
2021-10-15 15:12:31.473504	2021-10-15 15:12:31.473504	5374	19	1	19
2021-10-15 15:12:31.481121	2021-10-15 15:12:31.481121	7896	20	1	20
2021-10-15 15:12:31.488663	2021-10-15 15:12:31.488663	9299	21	1	21
2021-10-15 15:12:31.495227	2021-10-15 15:12:31.495227	13435	22	1	22
2021-10-15 15:12:31.510893	2021-10-15 15:12:31.510893	7489	23	1	23
2021-10-15 15:12:31.526862	2021-10-15 15:12:31.526862	597	24	1	24
2021-10-15 15:12:31.543751	2021-10-15 15:12:31.543751	6900	25	1	25
2021-10-15 15:12:31.570375	2021-10-15 15:12:31.570375	17499	26	1	26
2021-10-15 15:12:31.594819	2021-10-15 15:12:31.594819	10400	27	1	27
2021-10-15 15:12:31.614857	2021-10-15 15:12:31.614857	535000	28	1	28
2021-10-15 15:12:31.635918	2021-10-15 15:12:31.635918	1498	29	1	29
2021-10-15 15:12:31.658162	2021-10-15 15:12:31.658162	2000	30	1	30
2021-10-15 15:12:31.680073	2021-10-15 15:12:31.680073	89999	31	1	31
2021-10-15 15:12:31.696989	2021-10-15 15:12:31.696989	61500	32	1	32
2021-10-15 15:12:31.714522	2021-10-15 15:12:31.714522	52100	33	1	33
2021-10-15 15:12:31.733685	2021-10-15 15:12:31.733685	79900	34	1	34
2021-10-15 15:12:31.767316	2021-10-15 15:12:31.767316	249900	35	1	35
2021-10-15 15:12:31.788876	2021-10-15 15:12:31.788876	799	36	1	36
2021-10-15 15:12:31.806308	2021-10-15 15:12:31.806308	3304	37	1	37
2021-10-15 15:12:31.823137	2021-10-15 15:12:31.823137	21493	38	1	38
2021-10-15 15:12:31.855823	2021-10-15 15:12:31.855823	2499	39	1	39
2021-10-15 15:12:31.882364	2021-10-15 15:12:31.882364	5707	40	1	40
2021-10-15 15:12:31.905495	2021-10-15 15:12:31.905495	1273	41	1	41
2021-10-15 15:12:31.921518	2021-10-15 15:12:31.921518	3562	42	1	42
2021-10-15 15:12:31.992045	2021-10-15 15:12:31.992045	9999	43	1	43
2021-10-15 15:12:31.998304	2021-10-15 15:12:31.998304	9999	44	1	44
2021-10-15 15:12:32.004942	2021-10-15 15:12:32.004942	9999	45	1	45
2021-10-15 15:12:32.01122	2021-10-15 15:12:32.01122	9999	46	1	46
2021-10-15 15:12:32.049781	2021-10-15 15:12:32.049781	16000	47	1	47
2021-10-15 15:12:32.055322	2021-10-15 15:12:32.055322	16000	48	1	48
2021-10-15 15:12:32.060537	2021-10-15 15:12:32.060537	16000	49	1	49
2021-10-15 15:12:32.068563	2021-10-15 15:12:32.068563	16000	50	1	50
2021-10-15 15:12:32.108589	2021-10-15 15:12:32.108589	14000	51	1	51
2021-10-15 15:12:32.115223	2021-10-15 15:12:32.115223	14000	52	1	52
2021-10-15 15:12:32.122249	2021-10-15 15:12:32.122249	14000	53	1	53
2021-10-15 15:12:32.128546	2021-10-15 15:12:32.128546	14000	54	1	54
2021-10-15 15:12:32.159267	2021-10-15 15:12:32.159267	9995	55	1	55
2021-10-15 15:12:32.16653	2021-10-15 15:12:32.16653	9995	56	1	56
2021-10-15 15:12:32.172393	2021-10-15 15:12:32.172393	9995	57	1	57
2021-10-15 15:12:32.17807	2021-10-15 15:12:32.17807	9995	58	1	58
2021-10-15 15:12:32.208536	2021-10-15 15:12:32.208536	4495	59	1	59
2021-10-15 15:12:32.213761	2021-10-15 15:12:32.213761	4495	60	1	60
2021-10-15 15:12:32.219286	2021-10-15 15:12:32.219286	4495	61	1	61
2021-10-15 15:12:32.224285	2021-10-15 15:12:32.224285	4495	62	1	62
2021-10-15 15:12:32.296099	2021-10-15 15:12:32.296099	6500	63	1	63
2021-10-15 15:12:32.304332	2021-10-15 15:12:32.304332	6500	64	1	64
2021-10-15 15:12:32.311541	2021-10-15 15:12:32.311541	6500	65	1	65
2021-10-15 15:12:32.318934	2021-10-15 15:12:32.318934	6500	66	1	66
2021-10-15 15:12:32.366595	2021-10-15 15:12:32.366595	1550	67	1	67
2021-10-15 15:12:32.38769	2021-10-15 15:12:32.38769	675	68	1	68
2021-10-15 15:12:32.40549	2021-10-15 15:12:32.40549	1995	69	1	69
2021-10-15 15:12:32.421426	2021-10-15 15:12:32.421426	699	70	1	70
2021-10-15 15:12:32.438177	2021-10-15 15:12:32.438177	895	71	1	71
2021-10-15 15:12:32.454667	2021-10-15 15:12:32.454667	3250	72	1	72
2021-10-15 15:12:32.469533	2021-10-15 15:12:32.469533	6500	73	1	73
2021-10-15 15:12:32.485179	2021-10-15 15:12:32.485179	1999	74	1	74
2021-10-15 15:12:32.513391	2021-10-15 15:12:32.513391	18853	75	1	75
2021-10-15 15:12:32.549761	2021-10-15 15:12:32.549761	499	76	1	76
2021-10-15 15:12:32.598674	2021-10-15 15:12:32.598674	6500	77	1	77
2021-10-15 15:12:32.616601	2021-10-15 15:12:32.616601	29500	78	1	78
2021-10-15 15:12:32.638394	2021-10-15 15:12:32.638394	124500	79	1	79
2021-10-15 15:12:32.655582	2021-10-15 15:12:32.655582	2845	80	1	80
2021-10-15 15:12:32.68032	2021-10-15 15:12:32.68032	12500	81	1	81
2021-10-15 15:12:32.699403	2021-10-15 15:12:32.699403	13000	82	1	82
2021-10-15 15:12:32.718609	2021-10-15 15:12:32.718609	7000	83	1	83
2021-10-15 15:12:32.736522	2021-10-15 15:12:32.736522	1400	84	1	84
2021-10-15 15:12:32.753551	2021-10-15 15:12:32.753551	13000	85	1	85
2021-10-15 15:12:32.7904	2021-10-15 15:12:32.7904	10000	86	1	86
2021-10-15 15:12:32.802994	2021-10-15 15:12:32.802994	10000	87	1	87
2021-10-15 15:12:32.809655	2021-10-15 15:12:32.809655	10000	88	1	88
2021-11-08 13:37:34.93894	2021-11-08 13:37:34.93894	129900	89	1	89
2021-11-08 13:37:34.950879	2021-11-08 13:37:34.950879	139900	90	1	90
2021-11-08 13:37:34.959529	2021-11-08 13:37:34.959529	219900	91	1	91
2021-11-08 13:37:34.966614	2021-11-08 13:37:34.966614	229900	92	1	92
2021-11-08 13:37:35.001493	2021-11-08 13:37:35.001493	32900	93	1	93
2021-11-08 13:37:35.009589	2021-11-08 13:37:35.009589	44500	94	1	94
2021-11-08 13:37:35.031249	2021-11-08 13:37:35.031249	1899	95	1	95
2021-11-08 13:37:35.052094	2021-11-08 13:37:35.052094	31000	96	1	96
2021-11-08 13:37:35.089982	2021-11-08 13:37:35.089982	14374	97	1	97
2021-11-08 13:37:35.099963	2021-11-08 13:37:35.099963	16994	98	1	98
2021-11-08 13:37:35.137112	2021-11-08 13:37:35.137112	13785	99	1	99
2021-11-08 13:37:35.144298	2021-11-08 13:37:35.144298	14639	100	1	100
2021-11-08 13:37:35.150528	2021-11-08 13:37:35.150528	28181	101	1	101
2021-11-08 13:37:35.199285	2021-11-08 13:37:35.199285	108720	102	1	102
2021-11-08 13:37:35.209246	2021-11-08 13:37:35.209246	109995	103	1	103
2021-11-08 13:37:35.217484	2021-11-08 13:37:35.217484	93120	104	1	104
2021-11-08 13:37:35.225524	2021-11-08 13:37:35.225524	94920	105	1	105
2021-11-08 13:37:35.274336	2021-11-08 13:37:35.274336	3799	106	1	106
2021-11-08 13:37:35.27987	2021-11-08 13:37:35.27987	5374	107	1	107
2021-11-08 13:37:35.286851	2021-11-08 13:37:35.286851	7896	108	1	108
2021-11-08 13:37:35.293511	2021-11-08 13:37:35.293511	9299	109	1	109
2021-11-08 13:37:35.299664	2021-11-08 13:37:35.299664	13435	110	1	110
2021-11-08 13:37:35.319325	2021-11-08 13:37:35.319325	7489	111	1	111
2021-11-08 13:37:35.339892	2021-11-08 13:37:35.339892	597	112	1	112
2021-11-08 13:37:35.358423	2021-11-08 13:37:35.358423	6900	113	1	113
2021-11-08 13:37:35.377866	2021-11-08 13:37:35.377866	17499	114	1	114
2021-11-08 13:37:35.398278	2021-11-08 13:37:35.398278	10400	115	1	115
2021-11-08 13:37:35.415887	2021-11-08 13:37:35.415887	535000	116	1	116
2021-11-08 13:37:35.43226	2021-11-08 13:37:35.43226	1498	117	1	117
2021-11-08 13:37:35.453708	2021-11-08 13:37:35.453708	2000	118	1	118
2021-11-08 13:37:35.477829	2021-11-08 13:37:35.477829	89999	119	1	119
2021-11-08 13:37:35.495997	2021-11-08 13:37:35.495997	61500	120	1	120
2021-11-08 13:37:35.513489	2021-11-08 13:37:35.513489	52100	121	1	121
2021-11-08 13:37:35.530997	2021-11-08 13:37:35.530997	79900	122	1	122
2021-11-08 13:37:35.550905	2021-11-08 13:37:35.550905	249900	123	1	123
2021-11-08 13:37:35.566327	2021-11-08 13:37:35.566327	799	124	1	124
2021-11-08 13:37:35.582284	2021-11-08 13:37:35.582284	3304	125	1	125
2021-11-08 13:37:35.603012	2021-11-08 13:37:35.603012	21493	126	1	126
2021-11-08 13:37:35.620363	2021-11-08 13:37:35.620363	2499	127	1	127
2021-11-08 13:37:35.635403	2021-11-08 13:37:35.635403	5707	128	1	128
2021-11-08 13:37:35.649583	2021-11-08 13:37:35.649583	1273	129	1	129
2021-11-08 13:37:35.664396	2021-11-08 13:37:35.664396	3562	130	1	130
2021-11-08 13:37:35.705022	2021-11-08 13:37:35.705022	9999	131	1	131
2021-11-08 13:37:35.711081	2021-11-08 13:37:35.711081	9999	132	1	132
2021-11-08 13:37:35.717514	2021-11-08 13:37:35.717514	9999	133	1	133
2021-11-08 13:37:35.723675	2021-11-08 13:37:35.723675	9999	134	1	134
2021-11-08 13:37:35.756897	2021-11-08 13:37:35.756897	16000	135	1	135
2021-11-08 13:37:35.76323	2021-11-08 13:37:35.76323	16000	136	1	136
2021-11-08 13:37:35.773987	2021-11-08 13:37:35.773987	16000	137	1	137
2021-11-08 13:37:35.790174	2021-11-08 13:37:35.790174	16000	138	1	138
2021-11-08 13:37:35.847445	2021-11-08 13:37:35.847445	14000	139	1	139
2021-11-08 13:37:35.85458	2021-11-08 13:37:35.85458	14000	140	1	140
2021-11-08 13:37:35.861744	2021-11-08 13:37:35.861744	14000	141	1	141
2021-11-08 13:37:35.867564	2021-11-08 13:37:35.867564	14000	142	1	142
2021-11-08 13:37:35.907018	2021-11-08 13:37:35.907018	9995	143	1	143
2021-11-08 13:37:35.913251	2021-11-08 13:37:35.913251	9995	144	1	144
2021-11-08 13:37:35.920852	2021-11-08 13:37:35.920852	9995	145	1	145
2021-11-08 13:37:35.92641	2021-11-08 13:37:35.92641	9995	146	1	146
2021-11-08 13:37:35.958062	2021-11-08 13:37:35.958062	4495	147	1	147
2021-11-08 13:37:35.963349	2021-11-08 13:37:35.963349	4495	148	1	148
2021-11-08 13:37:35.971186	2021-11-08 13:37:35.971186	4495	149	1	149
2021-11-08 13:37:35.977661	2021-11-08 13:37:35.977661	4495	150	1	150
2021-11-08 13:37:36.013082	2021-11-08 13:37:36.013082	6500	151	1	151
2021-11-08 13:37:36.020152	2021-11-08 13:37:36.020152	6500	152	1	152
2021-11-08 13:37:36.027316	2021-11-08 13:37:36.027316	6500	153	1	153
2021-11-08 13:37:36.032705	2021-11-08 13:37:36.032705	6500	154	1	154
2021-11-08 13:37:36.086919	2021-11-08 13:37:36.086919	1550	155	1	155
2021-11-08 13:37:36.109616	2021-11-08 13:37:36.109616	675	156	1	156
2021-11-08 13:37:36.128956	2021-11-08 13:37:36.128956	1995	157	1	157
2021-11-08 13:37:36.146147	2021-11-08 13:37:36.146147	699	158	1	158
2021-11-08 13:37:36.163274	2021-11-08 13:37:36.163274	895	159	1	159
2021-11-08 13:37:36.182802	2021-11-08 13:37:36.182802	3250	160	1	160
2021-11-08 13:37:36.203629	2021-11-08 13:37:36.203629	6500	161	1	161
2021-11-08 13:37:36.217655	2021-11-08 13:37:36.217655	1999	162	1	162
2021-11-08 13:37:36.244092	2021-11-08 13:37:36.244092	18853	163	1	163
2021-11-08 13:37:36.26469	2021-11-08 13:37:36.26469	499	164	1	164
2021-11-08 13:37:36.283783	2021-11-08 13:37:36.283783	6500	165	1	165
2021-11-08 13:37:36.299897	2021-11-08 13:37:36.299897	29500	166	1	166
2021-11-08 13:37:36.317392	2021-11-08 13:37:36.317392	124500	167	1	167
2021-11-08 13:37:36.332895	2021-11-08 13:37:36.332895	2845	168	1	168
2021-11-08 13:37:36.349695	2021-11-08 13:37:36.349695	12500	169	1	169
2021-11-08 13:37:36.365413	2021-11-08 13:37:36.365413	13000	170	1	170
2021-11-08 13:37:36.383156	2021-11-08 13:37:36.383156	7000	171	1	171
2021-11-08 13:37:36.397462	2021-11-08 13:37:36.397462	1400	172	1	172
2021-11-08 13:37:36.413694	2021-11-08 13:37:36.413694	13000	173	1	173
2021-11-08 13:37:36.447265	2021-11-08 13:37:36.447265	10000	174	1	174
2021-11-08 13:37:36.454864	2021-11-08 13:37:36.454864	10000	175	1	175
2021-11-08 13:37:36.462198	2021-11-08 13:37:36.462198	10000	176	1	176
\.


--
-- Data for Name: product_variant_translation; Type: TABLE DATA; Schema: public; Owner: ghienan
--

COPY public.product_variant_translation ("createdAt", "updatedAt", "languageCode", name, id, "baseId") FROM stdin;
2021-10-15 15:12:31.151058	2021-10-15 15:12:31.153519	en	Laptop 13 inch 8GB	1	1
2021-10-15 15:12:31.167552	2021-10-15 15:12:31.168734	en	Laptop 15 inch 8GB	2	2
2021-10-15 15:12:31.174821	2021-10-15 15:12:31.176866	en	Laptop 13 inch 16GB	3	3
2021-10-15 15:12:31.183411	2021-10-15 15:12:31.184605	en	Laptop 15 inch 16GB	4	4
2021-10-15 15:12:31.21203	2021-10-15 15:12:31.213154	en	Tablet 32GB	5	5
2021-10-15 15:12:31.220144	2021-10-15 15:12:31.222088	en	Tablet 128GB	6	6
2021-10-15 15:12:31.244775	2021-10-15 15:12:31.245946	en	Wireless Optical Mouse	7	7
2021-10-15 15:12:31.268826	2021-10-15 15:12:31.269936	en	32-Inch Monitor	8	8
2021-10-15 15:12:31.298009	2021-10-15 15:12:31.299802	en	Curvy Monitor 24 inch	9	9
2021-10-15 15:12:31.305389	2021-10-15 15:12:31.306432	en	Curvy Monitor 27 inch	10	10
2021-10-15 15:12:31.33987	2021-10-15 15:12:31.340926	en	High Performance RAM 4GB	11	11
2021-10-15 15:12:31.345996	2021-10-15 15:12:31.347485	en	High Performance RAM 8GB	12	12
2021-10-15 15:12:31.353809	2021-10-15 15:12:31.354879	en	High Performance RAM 16GB	13	13
2021-10-15 15:12:31.400841	2021-10-15 15:12:31.402008	en	Gaming PC i7-8700 240GB SSD	14	14
2021-10-15 15:12:31.406497	2021-10-15 15:12:31.407514	en	Gaming PC R7-2700 240GB SSD	15	15
2021-10-15 15:12:31.413089	2021-10-15 15:12:31.414439	en	Gaming PC i7-8700 120GB SSD	16	16
2021-10-15 15:12:31.419429	2021-10-15 15:12:31.42047	en	Gaming PC R7-2700 120GB SSD	17	17
2021-10-15 15:12:31.463233	2021-10-15 15:12:31.464609	en	Hard Drive 1TB	18	18
2021-10-15 15:12:31.469146	2021-10-15 15:12:31.47012	en	Hard Drive 2TB	19	19
2021-10-15 15:12:31.474418	2021-10-15 15:12:31.47543	en	Hard Drive 3TB	20	20
2021-10-15 15:12:31.482926	2021-10-15 15:12:31.484463	en	Hard Drive 4TB	21	21
2021-10-15 15:12:31.48962	2021-10-15 15:12:31.491093	en	Hard Drive 6TB	22	22
2021-10-15 15:12:31.506892	2021-10-15 15:12:31.507881	en	Clacky Keyboard	23	23
2021-10-15 15:12:31.522841	2021-10-15 15:12:31.52383	en	Ethernet Cable	24	24
2021-10-15 15:12:31.539194	2021-10-15 15:12:31.540195	en	USB Cable	25	25
2021-10-15 15:12:31.564507	2021-10-15 15:12:31.567085	en	Instant Camera	26	26
2021-10-15 15:12:31.590199	2021-10-15 15:12:31.591367	en	Camera Lens	27	27
2021-10-15 15:12:31.610296	2021-10-15 15:12:31.611308	en	Vintage Folding Camera	28	28
2021-10-15 15:12:31.631057	2021-10-15 15:12:31.632145	en	Tripod	29	29
2021-10-15 15:12:31.652255	2021-10-15 15:12:31.653312	en	Instamatic Camera	30	30
2021-10-15 15:12:31.674619	2021-10-15 15:12:31.675681	en	Compact Digital Camera	31	31
2021-10-15 15:12:31.692534	2021-10-15 15:12:31.693553	en	Nikkormat SLR Camera	32	32
2021-10-15 15:12:31.709962	2021-10-15 15:12:31.711012	en	Compact SLR Camera	33	33
2021-10-15 15:12:31.729302	2021-10-15 15:12:31.730406	en	Twin Lens Camera	34	34
2021-10-15 15:12:31.761834	2021-10-15 15:12:31.763071	en	Road Bike	35	35
2021-10-15 15:12:31.784628	2021-10-15 15:12:31.785727	en	Skipping Rope	36	36
2021-10-15 15:12:31.801744	2021-10-15 15:12:31.802717	en	Boxing Gloves	37	37
2021-10-15 15:12:31.819244	2021-10-15 15:12:31.820211	en	Tent	38	38
2021-10-15 15:12:31.845864	2021-10-15 15:12:31.848735	en	Cruiser Skateboard	39	39
2021-10-15 15:12:31.877223	2021-10-15 15:12:31.878263	en	Football	40	40
2021-10-15 15:12:31.900625	2021-10-15 15:12:31.902052	en	Tennis Ball	41	41
2021-10-15 15:12:31.917698	2021-10-15 15:12:31.918566	en	Basketball	42	42
2021-10-15 15:12:31.986479	2021-10-15 15:12:31.987516	en	Ultraboost Running Shoe Size 40	43	43
2021-10-15 15:12:31.993069	2021-10-15 15:12:31.994115	en	Ultraboost Running Shoe Size 42	44	44
2021-10-15 15:12:31.999358	2021-10-15 15:12:32.000572	en	Ultraboost Running Shoe Size 44	45	45
2021-10-15 15:12:32.006194	2021-10-15 15:12:32.007557	en	Ultraboost Running Shoe Size 46	46	46
2021-10-15 15:12:32.043987	2021-10-15 15:12:32.045304	en	Freerun Running Shoe Size 40	47	47
2021-10-15 15:12:32.050913	2021-10-15 15:12:32.051939	en	Freerun Running Shoe Size 42	48	48
2021-10-15 15:12:32.056235	2021-10-15 15:12:32.057207	en	Freerun Running Shoe Size 44	49	49
2021-10-15 15:12:32.061488	2021-10-15 15:12:32.062486	en	Freerun Running Shoe Size 46	50	50
2021-10-15 15:12:32.102765	2021-10-15 15:12:32.103855	en	Hi-Top Basketball Shoe Size 40	51	51
2021-10-15 15:12:32.109632	2021-10-15 15:12:32.110776	en	Hi-Top Basketball Shoe Size 42	52	52
2021-10-15 15:12:32.11749	2021-10-15 15:12:32.118545	en	Hi-Top Basketball Shoe Size 44	53	53
2021-10-15 15:12:32.123165	2021-10-15 15:12:32.124661	en	Hi-Top Basketball Shoe Size 46	54	54
2021-10-15 15:12:32.153546	2021-10-15 15:12:32.154666	en	Pureboost Running Shoe Size 40	55	55
2021-10-15 15:12:32.16032	2021-10-15 15:12:32.161372	en	Pureboost Running Shoe Size 42	56	56
2021-10-15 15:12:32.167674	2021-10-15 15:12:32.168751	en	Pureboost Running Shoe Size 44	57	57
2021-10-15 15:12:32.173648	2021-10-15 15:12:32.174715	en	Pureboost Running Shoe Size 46	58	58
2021-10-15 15:12:32.204148	2021-10-15 15:12:32.205287	en	RunX Running Shoe Size 40	59	59
2021-10-15 15:12:32.209424	2021-10-15 15:12:32.210382	en	RunX Running Shoe Size 42	60	60
2021-10-15 15:12:32.214833	2021-10-15 15:12:32.215852	en	RunX Running Shoe Size 44	61	61
2021-10-15 15:12:32.220194	2021-10-15 15:12:32.221155	en	RunX Running Shoe Size 46	62	62
2021-10-15 15:12:32.284848	2021-10-15 15:12:32.287389	en	Allstar Sneakers Size 40	63	63
2021-10-15 15:12:32.29812	2021-10-15 15:12:32.299375	en	Allstar Sneakers Size 42	64	64
2021-10-15 15:12:32.305384	2021-10-15 15:12:32.30642	en	Allstar Sneakers Size 44	65	65
2021-10-15 15:12:32.313287	2021-10-15 15:12:32.314487	en	Allstar Sneakers Size 46	66	66
2021-10-15 15:12:32.359045	2021-10-15 15:12:32.361252	en	Spiky Cactus	67	67
2021-10-15 15:12:32.383266	2021-10-15 15:12:32.38427	en	Tulip Pot	68	68
2021-10-15 15:12:32.400628	2021-10-15 15:12:32.401732	en	Hanging Plant	69	69
2021-10-15 15:12:32.417558	2021-10-15 15:12:32.418521	en	Aloe Vera	70	70
2021-10-15 15:12:32.433421	2021-10-15 15:12:32.43533	en	Fern Blechnum Gibbum	71	71
2021-10-15 15:12:32.450612	2021-10-15 15:12:32.451605	en	Assorted Indoor Succulents	72	72
2021-10-15 15:12:32.465313	2021-10-15 15:12:32.466295	en	Orchid	73	73
2021-10-15 15:12:32.479834	2021-10-15 15:12:32.481058	en	Bonsai Tree	74	74
2021-10-15 15:12:32.509201	2021-10-15 15:12:32.510208	en	Guardian Lion Statue	75	75
2021-10-15 15:12:32.544605	2021-10-15 15:12:32.545892	en	Hand Trowel	76	76
2021-10-15 15:12:32.591885	2021-10-15 15:12:32.593667	en	Balloon Chair	77	77
2021-10-15 15:12:32.610373	2021-10-15 15:12:32.611463	en	Grey Fabric Sofa	78	78
2021-10-15 15:12:32.633677	2021-10-15 15:12:32.635178	en	Leather Sofa	79	79
2021-10-15 15:12:32.651203	2021-10-15 15:12:32.652384	en	Light Shade	80	80
2021-10-15 15:12:32.674595	2021-10-15 15:12:32.675746	en	Wooden Side Desk	81	81
2021-10-15 15:12:32.694583	2021-10-15 15:12:32.695673	en	Comfy Padded Chair	82	82
2021-10-15 15:12:32.712726	2021-10-15 15:12:32.714338	en	Black Eaves Chair	83	83
2021-10-15 15:12:32.729922	2021-10-15 15:12:32.731298	en	Wooden Stool	84	84
2021-10-15 15:12:32.748446	2021-10-15 15:12:32.749349	en	Bedside Table	85	85
2021-10-15 15:12:32.783125	2021-10-15 15:12:32.784643	en	Modern Cafe Chair mustard	86	86
2021-10-15 15:12:32.797237	2021-10-15 15:12:32.798656	en	Modern Cafe Chair mint	87	87
2021-10-15 15:12:32.803984	2021-10-15 15:12:32.805003	en	Modern Cafe Chair pearl	88	88
2021-11-08 13:37:34.903386	2021-11-08 13:37:34.91028	en	Laptop 13 inch 8GB	89	89
2021-11-08 13:37:34.944055	2021-11-08 13:37:34.945374	en	Laptop 15 inch 8GB	90	90
2021-11-08 13:37:34.952067	2021-11-08 13:37:34.953984	en	Laptop 13 inch 16GB	91	91
2021-11-08 13:37:34.960723	2021-11-08 13:37:34.961902	en	Laptop 15 inch 16GB	92	92
2021-11-08 13:37:34.993088	2021-11-08 13:37:34.994412	en	Tablet 32GB	93	93
2021-11-08 13:37:35.002934	2021-11-08 13:37:35.004667	en	Tablet 128GB	94	94
2021-11-08 13:37:35.025387	2021-11-08 13:37:35.026648	en	Wireless Optical Mouse	95	95
2021-11-08 13:37:35.045979	2021-11-08 13:37:35.047872	en	32-Inch Monitor	96	96
2021-11-08 13:37:35.082262	2021-11-08 13:37:35.083698	en	Curvy Monitor 24 inch	97	97
2021-11-08 13:37:35.09136	2021-11-08 13:37:35.092812	en	Curvy Monitor 27 inch	98	98
2021-11-08 13:37:35.131206	2021-11-08 13:37:35.132372	en	High Performance RAM 4GB	99	99
2021-11-08 13:37:35.138626	2021-11-08 13:37:35.139912	en	High Performance RAM 8GB	100	100
2021-11-08 13:37:35.145389	2021-11-08 13:37:35.146507	en	High Performance RAM 16GB	101	101
2021-11-08 13:37:35.193103	2021-11-08 13:37:35.194418	en	Gaming PC i7-8700 240GB SSD	102	102
2021-11-08 13:37:35.200562	2021-11-08 13:37:35.201901	en	Gaming PC R7-2700 240GB SSD	103	103
2021-11-08 13:37:35.211135	2021-11-08 13:37:35.21263	en	Gaming PC i7-8700 120GB SSD	104	104
2021-11-08 13:37:35.21869	2021-11-08 13:37:35.220429	en	Gaming PC R7-2700 120GB SSD	105	105
2021-11-08 13:37:35.267914	2021-11-08 13:37:35.269213	en	Hard Drive 1TB	106	106
2021-11-08 13:37:35.275279	2021-11-08 13:37:35.276289	en	Hard Drive 2TB	107	107
2021-11-08 13:37:35.280802	2021-11-08 13:37:35.282026	en	Hard Drive 3TB	108	108
2021-11-08 13:37:35.288339	2021-11-08 13:37:35.289766	en	Hard Drive 4TB	109	109
2021-11-08 13:37:35.294485	2021-11-08 13:37:35.295496	en	Hard Drive 6TB	110	110
2021-11-08 13:37:35.31423	2021-11-08 13:37:35.315397	en	Clacky Keyboard	111	111
2021-11-08 13:37:35.333772	2021-11-08 13:37:35.335007	en	Ethernet Cable	112	112
2021-11-08 13:37:35.351812	2021-11-08 13:37:35.353344	en	USB Cable	113	113
2021-11-08 13:37:35.372436	2021-11-08 13:37:35.374069	en	Instant Camera	114	114
2021-11-08 13:37:35.392634	2021-11-08 13:37:35.394039	en	Camera Lens	115	115
2021-11-08 13:37:35.411437	2021-11-08 13:37:35.412425	en	Vintage Folding Camera	116	116
2021-11-08 13:37:35.427807	2021-11-08 13:37:35.428839	en	Tripod	117	117
2021-11-08 13:37:35.447801	2021-11-08 13:37:35.448937	en	Instamatic Camera	118	118
2021-11-08 13:37:35.469606	2021-11-08 13:37:35.473218	en	Compact Digital Camera	119	119
2021-11-08 13:37:35.49137	2021-11-08 13:37:35.492293	en	Nikkormat SLR Camera	120	120
2021-11-08 13:37:35.508726	2021-11-08 13:37:35.509848	en	Compact SLR Camera	121	121
2021-11-08 13:37:35.525928	2021-11-08 13:37:35.527502	en	Twin Lens Camera	122	122
2021-11-08 13:37:35.543949	2021-11-08 13:37:35.546079	en	Road Bike	123	123
2021-11-08 13:37:35.561897	2021-11-08 13:37:35.562945	en	Skipping Rope	124	124
2021-11-08 13:37:35.578082	2021-11-08 13:37:35.579108	en	Boxing Gloves	125	125
2021-11-08 13:37:35.598387	2021-11-08 13:37:35.599435	en	Tent	126	126
2021-11-08 13:37:35.615696	2021-11-08 13:37:35.616697	en	Cruiser Skateboard	127	127
2021-11-08 13:37:35.631175	2021-11-08 13:37:35.632435	en	Football	128	128
2021-11-08 13:37:35.645902	2021-11-08 13:37:35.646782	en	Tennis Ball	129	129
2021-11-08 13:37:35.660588	2021-11-08 13:37:35.661514	en	Basketball	130	130
2021-11-08 13:37:35.699465	2021-11-08 13:37:35.700524	en	Ultraboost Running Shoe Size 40	131	131
2021-11-08 13:37:35.70615	2021-11-08 13:37:35.707396	en	Ultraboost Running Shoe Size 42	132	132
2021-11-08 13:37:35.712327	2021-11-08 13:37:35.713436	en	Ultraboost Running Shoe Size 44	133	133
2021-11-08 13:37:35.718584	2021-11-08 13:37:35.719913	en	Ultraboost Running Shoe Size 46	134	134
2021-11-08 13:37:35.75023	2021-11-08 13:37:35.752551	en	Freerun Running Shoe Size 40	135	135
2021-11-08 13:37:35.757929	2021-11-08 13:37:35.758985	en	Freerun Running Shoe Size 42	136	136
2021-11-08 13:37:35.764888	2021-11-08 13:37:35.766356	en	Freerun Running Shoe Size 44	137	137
2021-11-08 13:37:35.777848	2021-11-08 13:37:35.781052	en	Freerun Running Shoe Size 46	138	138
2021-11-08 13:37:35.835054	2021-11-08 13:37:35.837389	en	Hi-Top Basketball Shoe Size 40	139	139
2021-11-08 13:37:35.849416	2021-11-08 13:37:35.850488	en	Hi-Top Basketball Shoe Size 42	140	140
2021-11-08 13:37:35.855595	2021-11-08 13:37:35.856599	en	Hi-Top Basketball Shoe Size 44	141	141
2021-11-08 13:37:35.86283	2021-11-08 13:37:35.863852	en	Hi-Top Basketball Shoe Size 46	142	142
2021-11-08 13:37:35.899895	2021-11-08 13:37:35.900951	en	Pureboost Running Shoe Size 40	143	143
2021-11-08 13:37:35.90803	2021-11-08 13:37:35.909032	en	Pureboost Running Shoe Size 42	144	144
2021-11-08 13:37:35.914801	2021-11-08 13:37:35.916664	en	Pureboost Running Shoe Size 44	145	145
2021-11-08 13:37:35.921849	2021-11-08 13:37:35.922866	en	Pureboost Running Shoe Size 46	146	146
2021-11-08 13:37:35.953314	2021-11-08 13:37:35.954525	en	RunX Running Shoe Size 40	147	147
2021-11-08 13:37:35.958982	2021-11-08 13:37:35.959936	en	RunX Running Shoe Size 42	148	148
2021-11-08 13:37:35.964273	2021-11-08 13:37:35.965279	en	RunX Running Shoe Size 44	149	149
2021-11-08 13:37:35.972499	2021-11-08 13:37:35.973756	en	RunX Running Shoe Size 46	150	150
2021-11-08 13:37:36.008471	2021-11-08 13:37:36.009576	en	Allstar Sneakers Size 40	151	151
2021-11-08 13:37:36.014057	2021-11-08 13:37:36.015059	en	Allstar Sneakers Size 42	152	152
2021-11-08 13:37:36.021181	2021-11-08 13:37:36.022254	en	Allstar Sneakers Size 44	153	153
2021-11-08 13:37:36.028225	2021-11-08 13:37:36.029193	en	Allstar Sneakers Size 46	154	154
2021-11-08 13:37:36.081648	2021-11-08 13:37:36.083146	en	Spiky Cactus	155	155
2021-11-08 13:37:36.104155	2021-11-08 13:37:36.106413	en	Tulip Pot	156	156
2021-11-08 13:37:36.124542	2021-11-08 13:37:36.125602	en	Hanging Plant	157	157
2021-11-08 13:37:36.142005	2021-11-08 13:37:36.143146	en	Aloe Vera	158	158
2021-11-08 13:37:36.15826	2021-11-08 13:37:36.159631	en	Fern Blechnum Gibbum	159	159
2021-11-08 13:37:36.176716	2021-11-08 13:37:36.179284	en	Assorted Indoor Succulents	160	160
2021-11-08 13:37:36.198801	2021-11-08 13:37:36.199872	en	Orchid	161	161
2021-11-08 13:37:36.21415	2021-11-08 13:37:36.214987	en	Bonsai Tree	162	162
2021-11-08 13:37:36.233613	2021-11-08 13:37:36.23529	en	Guardian Lion Statue	163	163
2021-11-08 13:37:36.260113	2021-11-08 13:37:36.261353	en	Hand Trowel	164	164
2021-11-08 13:37:36.278413	2021-11-08 13:37:36.279516	en	Balloon Chair	165	165
2021-11-08 13:37:36.295515	2021-11-08 13:37:36.296455	en	Grey Fabric Sofa	166	166
2021-11-08 13:37:36.311806	2021-11-08 13:37:36.312722	en	Leather Sofa	167	167
2021-11-08 13:37:36.328833	2021-11-08 13:37:36.329857	en	Light Shade	168	168
2021-11-08 13:37:36.344386	2021-11-08 13:37:36.346188	en	Wooden Side Desk	169	169
2021-11-08 13:37:36.360859	2021-11-08 13:37:36.36231	en	Comfy Padded Chair	170	170
2021-11-08 13:37:36.379002	2021-11-08 13:37:36.380048	en	Black Eaves Chair	171	171
2021-11-08 13:37:36.393143	2021-11-08 13:37:36.394041	en	Wooden Stool	172	172
2021-11-08 13:37:36.408811	2021-11-08 13:37:36.410276	en	Bedside Table	173	173
2021-11-08 13:37:36.436102	2021-11-08 13:37:36.437796	en	Modern Cafe Chair mustard	174	174
2021-11-08 13:37:36.448244	2021-11-08 13:37:36.449312	en	Modern Cafe Chair mint	175	175
2021-11-08 13:37:36.456308	2021-11-08 13:37:36.457392	en	Modern Cafe Chair pearl	176	176
\.


--
-- Data for Name: promotion; Type: TABLE DATA; Schema: public; Owner: ghienan
--

COPY public.promotion ("createdAt", "updatedAt", "deletedAt", "startsAt", "endsAt", "couponCode", "perCustomerUsageLimit", name, enabled, conditions, actions, "priorityScore", id) FROM stdin;
\.


--
-- Data for Name: promotion_channels_channel; Type: TABLE DATA; Schema: public; Owner: ghienan
--

COPY public.promotion_channels_channel ("promotionId", "channelId") FROM stdin;
\.


--
-- Data for Name: refund; Type: TABLE DATA; Schema: public; Owner: ghienan
--

COPY public.refund ("createdAt", "updatedAt", items, shipping, adjustment, total, method, reason, state, "transactionId", metadata, id, "paymentId") FROM stdin;
\.


--
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: ghienan
--

COPY public.role ("createdAt", "updatedAt", code, description, permissions, id) FROM stdin;
2021-10-15 15:12:29.145846	2021-10-15 15:12:29.145846	__super_admin_role__	SuperAdmin	Authenticated,SuperAdmin,UpdateGlobalSettings,CreateCatalog,ReadCatalog,UpdateCatalog,DeleteCatalog,CreateSettings,ReadSettings,UpdateSettings,DeleteSettings,CreateAdministrator,ReadAdministrator,UpdateAdministrator,DeleteAdministrator,CreateAsset,ReadAsset,UpdateAsset,DeleteAsset,CreateChannel,ReadChannel,UpdateChannel,DeleteChannel,CreateCollection,ReadCollection,UpdateCollection,DeleteCollection,CreateCountry,ReadCountry,UpdateCountry,DeleteCountry,CreateCustomer,ReadCustomer,UpdateCustomer,DeleteCustomer,CreateCustomerGroup,ReadCustomerGroup,UpdateCustomerGroup,DeleteCustomerGroup,CreateFacet,ReadFacet,UpdateFacet,DeleteFacet,CreateOrder,ReadOrder,UpdateOrder,DeleteOrder,CreatePaymentMethod,ReadPaymentMethod,UpdatePaymentMethod,DeletePaymentMethod,CreateProduct,ReadProduct,UpdateProduct,DeleteProduct,CreatePromotion,ReadPromotion,UpdatePromotion,DeletePromotion,CreateShippingMethod,ReadShippingMethod,UpdateShippingMethod,DeleteShippingMethod,CreateTag,ReadTag,UpdateTag,DeleteTag,CreateTaxCategory,ReadTaxCategory,UpdateTaxCategory,DeleteTaxCategory,CreateTaxRate,ReadTaxRate,UpdateTaxRate,DeleteTaxRate,CreateSystem,ReadSystem,UpdateSystem,DeleteSystem,CreateZone,ReadZone,UpdateZone,DeleteZone	1
2021-10-15 15:12:29.155171	2021-10-15 15:12:29.155171	__customer_role__	Customer	Authenticated	2
2021-10-15 15:12:30.960358	2021-10-15 15:12:30.960358	administrator	Administrator	Authenticated,CreateCatalog,ReadCatalog,UpdateCatalog,DeleteCatalog,CreateSettings,ReadSettings,UpdateSettings,DeleteSettings,CreateCustomer,ReadCustomer,UpdateCustomer,DeleteCustomer,CreateCustomerGroup,ReadCustomerGroup,UpdateCustomerGroup,DeleteCustomerGroup,CreateOrder,ReadOrder,UpdateOrder,DeleteOrder,CreateSystem,ReadSystem,UpdateSystem,DeleteSystem	3
2021-10-15 15:12:30.963902	2021-10-15 15:12:30.963902	order-manager	Order manager	Authenticated,CreateOrder,ReadOrder,UpdateOrder,DeleteOrder,ReadCustomer,ReadPaymentMethod,ReadShippingMethod,ReadPromotion,ReadCountry,ReadZone	4
2021-10-15 15:12:30.966263	2021-10-15 15:12:30.966263	inventory-manager	Inventory manager	Authenticated,CreateCatalog,ReadCatalog,UpdateCatalog,DeleteCatalog,CreateTag,ReadTag,UpdateTag,DeleteTag,ReadCustomer	5
2021-11-08 13:37:34.694766	2021-11-08 13:37:34.694766	administrator	Administrator	Authenticated,CreateCatalog,ReadCatalog,UpdateCatalog,DeleteCatalog,CreateSettings,ReadSettings,UpdateSettings,DeleteSettings,CreateCustomer,ReadCustomer,UpdateCustomer,DeleteCustomer,CreateCustomerGroup,ReadCustomerGroup,UpdateCustomerGroup,DeleteCustomerGroup,CreateOrder,ReadOrder,UpdateOrder,DeleteOrder,CreateSystem,ReadSystem,UpdateSystem,DeleteSystem	6
2021-11-08 13:37:34.70443	2021-11-08 13:37:34.70443	order-manager	Order manager	Authenticated,CreateOrder,ReadOrder,UpdateOrder,DeleteOrder,ReadCustomer,ReadPaymentMethod,ReadShippingMethod,ReadPromotion,ReadCountry,ReadZone	7
2021-11-08 13:37:34.707062	2021-11-08 13:37:34.707062	inventory-manager	Inventory manager	Authenticated,CreateCatalog,ReadCatalog,UpdateCatalog,DeleteCatalog,CreateTag,ReadTag,UpdateTag,DeleteTag,ReadCustomer	8
\.


--
-- Data for Name: role_channels_channel; Type: TABLE DATA; Schema: public; Owner: ghienan
--

COPY public.role_channels_channel ("roleId", "channelId") FROM stdin;
1	1
2	1
3	1
4	1
5	1
6	1
7	1
8	1
\.


--
-- Data for Name: search_index_item; Type: TABLE DATA; Schema: public; Owner: ghienan
--

COPY public.search_index_item ("languageCode", enabled, "productName", "productVariantName", description, slug, sku, price, "priceWithTax", "facetIds", "facetValueIds", "collectionIds", "collectionSlugs", "channelIds", "productPreview", "productPreviewFocalPoint", "productVariantPreview", "productVariantPreviewFocalPoint", "inStock", "productInStock", "productVariantId", "channelId", "productId", "productAssetId", "productVariantAssetId") FROM stdin;
en	t	Hard Drive	Hard Drive 1TB	Boost your PC storage with this internal hard drive, designed just for desktop and all-in-one PCs.	hard-drive	IHD455T1	3799	3799	2,1	8,1,2	12,11	computers-2,electronics-2	1	preview\\96\\vincent-botta-736919-unsplash__preview.jpg	\N		\N	t	t	106	1	62	62	\N
en	t	Nikkormat SLR Camera	Nikkormat SLR Camera	The Nikkormat FS was brought to market by Nikon in 1965. The lens is a 50mm f1.4 Nikkor. Nice glass, smooth focus and a working diaphragm. A UV filter and a Nikon front lens cap are included with the lens.	nikkormat-slr-camera	B07D33B334	61500	61500	2,1	11,1,9	13,11	camera-photo-2,electronics-2	1	preview\\95\\chuttersnap-324234-unsplash__preview.jpg	\N		\N	t	t	120	1	72	72	\N
en	t	Allstar Sneakers	Allstar Sneakers Size 40	All Star is the most iconic sneaker in the world, recognised for its unmistakable silhouette, star-centred ankle patch and cultural authenticity. And like the best paradigms, it only gets better with time.	allstar-sneakers	CAS23340	6500	6500	3,2,1	27,29,17,23			1	preview\\aa\\mitch-lensink-256007-unsplash__preview.jpg	\N		\N	t	t	151	1	88	88	\N
en	t	Compact Digital Camera	Compact Digital Camera	Unleash your creative potential with high-level performance and advanced features such as AI-powered Real-time Eye AF; new, high-precision Real-time Tracking; high-speed continuous shooting and 4K HDR movie-shooting. The camera's innovative AF quickly and reliably detects the position of the subject and then tracks the subject's motion, keeping it in sharp focus.	compact-digital-camera	B07D990021	89999	89999	2,1	15,1,9	13,11	camera-photo-2,electronics-2	1	preview\\bc\\patrick-brinksma-663044-unsplash__preview.jpg	\N		\N	t	t	119	1	71	71	\N
en	t	High Performance RAM	High Performance RAM 16GB	Each RAM module is built with a pure aluminium heat spreader for faster heat dissipation and cooler operation. Enhanced to XMP 2.0 profiles for better overclocking; Compatibility: Intel 100 Series, Intel 200 Series, Intel 300 Series, Intel X299, AMD 300 Series, AMD 400 Series.	high-performance-ram	CMK32GX4M2AC16	28181	28181	2,1	6,1,2	12,11	computers-2,electronics-2	1	preview\\58\\liam-briese-1128307-unsplash__preview.jpg	\N		\N	t	t	101	1	60	60	\N
en	t	Hard Drive	Hard Drive 3TB	Boost your PC storage with this internal hard drive, designed just for desktop and all-in-one PCs.	hard-drive	IHD455T3	7896	7896	2,1	8,1,2	12,11,3,2	computers-2,electronics-2,computers,electronics	1	preview\\96\\vincent-botta-736919-unsplash__preview.jpg	\N		\N	t	t	20	1	8	8	\N
en	t	USB Cable	USB Cable	Solid conductors eliminate strand-interaction distortion and reduce jitter. As the surface is made of high-purity silver, the performance is very close to that of a solid silver cable, but priced much closer to solid copper cable.	usb-cable	USBCIN01.5MI	6900	6900	1	1,2	12,11,3,2	computers-2,electronics-2,computers,electronics	1	preview\\64\\adam-birkett-239153-unsplash__preview.jpg	\N		\N	t	t	25	1	11	11	\N
en	t	Instant Camera	Instant Camera	With its nostalgic design and simple point-and-shoot functionality, the Instant Camera is the perfect pick to get started with instant photography.	instant-camera	IC22MWDD	17499	17499	2,1	10,1,9	13,11,4,2	camera-photo-2,electronics-2,camera-photo,electronics	1	preview\\b5\\eniko-kis-663725-unsplash__preview.jpg	\N		\N	t	t	26	1	12	12	\N
en	t	Freerun Running Shoe	Freerun Running Shoe Size 44	The Freerun Men's Running Shoe is built for record-breaking speed. The Flyknit upper delivers ultra-lightweight support that fits like a glove.	freerun-running-shoe	AR4561-44	16000	16000	3,2,1	27,21,17,23			1	preview\\0f\\imani-clovis-234736-unsplash__preview.jpg	\N		\N	t	t	137	1	84	84	\N
en	t	Freerun Running Shoe	Freerun Running Shoe Size 42	The Freerun Men's Running Shoe is built for record-breaking speed. The Flyknit upper delivers ultra-lightweight support that fits like a glove.	freerun-running-shoe	AR4561-42	16000	16000	3,2,1	27,21,17,23			1	preview\\0f\\imani-clovis-234736-unsplash__preview.jpg	\N		\N	t	t	136	1	84	84	\N
en	t	Modern Cafe Chair	Modern Cafe Chair mustard	You sit comfortably thanks to the restful flexibility of the seat. Lightweight and easy to move around, yet stable enough even for the liveliest, young family members.	modern-cafe-chair	404.038.96	10000	10000	3,1	38,30,34	15,14,6,5	furniture-2,home-garden-2,furniture,home-garden	1	preview\\b1\\jean-philippe-delberghe-1400011-unsplash__preview.jpg	\N		\N	t	t	86	1	54	54	\N
en	t	Camera Lens	Camera Lens	This lens is a Di type lens using an optical system with improved multi-coating designed to function with digital SLR cameras as well as film cameras.	camera-lens	B0012UUP02	10400	10400	2,1	11,1,9	13,11,4,2	camera-photo-2,electronics-2,camera-photo,electronics	1	preview\\9b\\brandi-redd-104140-unsplash__preview.jpg	\N		\N	t	t	27	1	13	13	\N
en	t	RunX Running Shoe	RunX Running Shoe Size 44	These running shoes are made with an airy, lightweight mesh upper. The durable rubber outsole grips the pavement for added stability. A cushioned midsole brings comfort to each step.	runx-running-shoe	F3633344	4495	4495	3,2,1	27,24,17,23			1	preview\\00\\nikolai-chernichenko-1299748-unsplash__preview.jpg	\N		\N	t	t	149	1	87	87	\N
en	t	Tablet	Tablet 32GB	If the computer were invented today, what would it look like? It would be powerful enough for any task. So mobile you could take it everywhere. And so intuitive you could use it any way you wanted ΓÇö with touch, a keyboard, or even a pencil. In other words, it wouldnΓÇÖt really be a "computer." It would be Tablet.	tablet	TBL200032	32900	32900	2,1	3,1,2	12,11	computers-2,electronics-2	1	preview\\b8\\kelly-sikkema-685291-unsplash__preview.jpg	\N		\N	t	t	93	1	56	56	\N
en	t	High Performance RAM	High Performance RAM 4GB	Each RAM module is built with a pure aluminium heat spreader for faster heat dissipation and cooler operation. Enhanced to XMP 2.0 profiles for better overclocking; Compatibility: Intel 100 Series, Intel 200 Series, Intel 300 Series, Intel X299, AMD 300 Series, AMD 400 Series.	high-performance-ram	CMK32GX4M2AC04	13785	13785	2,1	6,1,2	12,11,3,2	computers-2,electronics-2,computers,electronics	1	preview\\58\\liam-briese-1128307-unsplash__preview.jpg	\N		\N	t	t	11	1	6	6	\N
en	t	Freerun Running Shoe	Freerun Running Shoe Size 40	The Freerun Men's Running Shoe is built for record-breaking speed. The Flyknit upper delivers ultra-lightweight support that fits like a glove.	freerun-running-shoe	AR4561-40	16000	16000	3,2,1	27,21,17,23			1	preview\\0f\\imani-clovis-234736-unsplash__preview.jpg	\N		\N	t	t	135	1	84	84	\N
en	t	Cruiser Skateboard	Cruiser Skateboard	Based on the 1970s iconic shape, but made to a larger 69cm size, with updated, quality component, these skateboards are great for beginners to learn the foot spacing required, and are perfect for all-day cruising.	cruiser-skateboard	799872520	2499	2499	1	17,18	9,8	equipment,sports-outdoor	1	preview\\35\\max-tarkhov-737999-unsplash__preview.jpg	\N		\N	t	t	39	1	25	25	\N
en	t	Ultraboost Running Shoe	Ultraboost Running Shoe Size 40	With its ultra-light, uber-responsive magic foam and a carbon fiber plate that feels like itΓÇÖs propelling you forward, the Running Shoe is ready to push you to victories both large and small	ultraboost-running-shoe	RS0040	9999	9999	3,2,1	25,26,24,17,23			1	preview\\ed\\chuttersnap-584518-unsplash__preview.jpg	\N		\N	t	t	131	1	83	83	\N
en	t	Gaming PC	Gaming PC R7-2700 120GB SSD	This pc is optimised for gaming, and is also VR ready. The Intel Core-i7 CPU and High Performance GPU give the computer the raw power it needs to function at a high level.	gaming-pc	CGS480VR1066	94920	94920	2,1	7,1,2	12,11,3,2	computers-2,electronics-2,computers,electronics	1	preview\\5a\\florian-olivo-1166419-unsplash__preview.jpg	\N		\N	t	t	17	1	7	7	\N
en	t	Allstar Sneakers	Allstar Sneakers Size 46	All Star is the most iconic sneaker in the world, recognised for its unmistakable silhouette, star-centred ankle patch and cultural authenticity. And like the best paradigms, it only gets better with time.	allstar-sneakers	CAS23346	6500	6500	3,2,1	27,29,17,23	10,8	footwear,sports-outdoor	1	preview\\aa\\mitch-lensink-256007-unsplash__preview.jpg	\N		\N	t	t	66	1	34	34	\N
en	t	Hi-Top Basketball Shoe	Hi-Top Basketball Shoe Size 46	Boasting legendary performance since 2008, the Hyperdunkz Basketball Shoe needs no gimmicks to stand out. Air units deliver best-in-class cushioning, while a dynamic lacing system keeps your foot snug and secure, so you can focus on your game and nothing else.	hi-top-basketball-shoe	AO7893-46	14000	14000	3,2,1	28,21,17,23			1	preview\\3c\\xavier-teo-469050-unsplash__preview.jpg	\N		\N	t	t	142	1	85	85	\N
en	t	Laptop	Laptop 13 inch 8GB	Now equipped with seventh-generation Intel Core processors, Laptop is snappier than ever. From daily tasks like launching apps and opening files to more advanced computing, you can power through your day thanks to faster SSDs and Turbo Boost processing up to 3.6GHz.	laptop	L2201308	129900	129900	2,1	3,1,2	12,11	computers-2,electronics-2	1	preview\\71\\derick-david-409858-unsplash__preview.jpg	\N		\N	t	t	89	1	55	55	\N
en	t	Compact SLR Camera	Compact SLR Camera	Retro styled, portable in size and built around a powerful 24-megapixel APS-C CMOS sensor, this digital camera is the ideal companion for creative everyday photography. Packed full of high spec features such as an advanced hybrid autofocus system able to keep pace with even the most active subjects, a speedy 6fps continuous-shooting mode, high-resolution electronic viewfinder and intuitive swivelling touchscreen, it brings professional image making into everyoneΓÇÖs grasp.	compact-slr-camera	B07D75V44S	52100	52100	1	1,9	13,11,4,2	camera-photo-2,electronics-2,camera-photo,electronics	1	preview\\9d\\robert-shunev-528016-unsplash__preview.jpg	\N		\N	t	t	33	1	19	19	\N
en	t	Pureboost Running Shoe	Pureboost Running Shoe Size 44	Built to handle curbs, corners and uneven sidewalks, these natural running shoes have an expanded landing zone and a heel plate for added stability. A lightweight and stretchy knit upper supports your native stride.	pureboost-running-shoe	F3578644	9995	9995	3,2,1	28,27,24,17,23	10,8	footwear,sports-outdoor	1	preview\\a2\\thomas-serer-420833-unsplash__preview.jpg	\N		\N	t	t	57	1	32	32	\N
en	t	Hard Drive	Hard Drive 4TB	Boost your PC storage with this internal hard drive, designed just for desktop and all-in-one PCs.	hard-drive	IHD455T4	9299	9299	2,1	8,1,2	12,11	computers-2,electronics-2	1	preview\\96\\vincent-botta-736919-unsplash__preview.jpg	\N		\N	t	t	109	1	62	62	\N
en	t	Compact Digital Camera	Compact Digital Camera	Unleash your creative potential with high-level performance and advanced features such as AI-powered Real-time Eye AF; new, high-precision Real-time Tracking; high-speed continuous shooting and 4K HDR movie-shooting. The camera's innovative AF quickly and reliably detects the position of the subject and then tracks the subject's motion, keeping it in sharp focus.	compact-digital-camera	B07D990021	89999	89999	2,1	15,1,9	13,11,4,2	camera-photo-2,electronics-2,camera-photo,electronics	1	preview\\bc\\patrick-brinksma-663044-unsplash__preview.jpg	\N		\N	t	t	31	1	17	17	\N
en	t	Freerun Running Shoe	Freerun Running Shoe Size 40	The Freerun Men's Running Shoe is built for record-breaking speed. The Flyknit upper delivers ultra-lightweight support that fits like a glove.	freerun-running-shoe	AR4561-40	16000	16000	3,2,1	27,21,17,23	10,8	footwear,sports-outdoor	1	preview\\0f\\imani-clovis-234736-unsplash__preview.jpg	\N		\N	t	t	47	1	30	30	\N
en	t	Twin Lens Camera	Twin Lens Camera	What makes a Rolleiflex TLR so special? Many things. To start, TLR stands for twin lens reflex. ΓÇ£TwinΓÇ¥ because there are two lenses. And reflex means that the photographer looks through the lens to view the reflected image of an object or scene on the focusing screen.	twin-lens-camera	B07D78JTLR	79900	79900	2,1	16,1,9	13,11,4,2	camera-photo-2,electronics-2,camera-photo,electronics	1	preview\\ef\\alexander-andrews-260988-unsplash__preview.jpg	\N		\N	t	t	34	1	20	20	\N
en	t	High Performance RAM	High Performance RAM 8GB	Each RAM module is built with a pure aluminium heat spreader for faster heat dissipation and cooler operation. Enhanced to XMP 2.0 profiles for better overclocking; Compatibility: Intel 100 Series, Intel 200 Series, Intel 300 Series, Intel X299, AMD 300 Series, AMD 400 Series.	high-performance-ram	CMK32GX4M2AC08	14639	14639	2,1	6,1,2	12,11,3,2	computers-2,electronics-2,computers,electronics	1	preview\\58\\liam-briese-1128307-unsplash__preview.jpg	\N		\N	t	t	12	1	6	6	\N
en	t	Curvy Monitor	Curvy Monitor 27 inch	Discover a truly immersive viewing experience with this monitor curved more deeply than any other. Wrapping around your field of vision the 1,800 R screencreates a wider field of view, enhances depth perception, and minimises peripheral distractions to draw you deeper in to your content.	curvy-monitor	C27F390	16994	16994	2,1	5,1,2	12,11,3,2	computers-2,electronics-2,computers,electronics	1	preview\\9c\\alexandru-acea-686569-unsplash__preview.jpg	\N		\N	t	t	10	1	5	5	\N
en	t	Hard Drive	Hard Drive 1TB	Boost your PC storage with this internal hard drive, designed just for desktop and all-in-one PCs.	hard-drive	IHD455T1	3799	3799	2,1	8,1,2	12,11,3,2	computers-2,electronics-2,computers,electronics	1	preview\\96\\vincent-botta-736919-unsplash__preview.jpg	\N		\N	t	t	18	1	8	8	\N
en	t	Hi-Top Basketball Shoe	Hi-Top Basketball Shoe Size 40	Boasting legendary performance since 2008, the Hyperdunkz Basketball Shoe needs no gimmicks to stand out. Air units deliver best-in-class cushioning, while a dynamic lacing system keeps your foot snug and secure, so you can focus on your game and nothing else.	hi-top-basketball-shoe	AO7893-40	14000	14000	3,2,1	28,21,17,23			1	preview\\3c\\xavier-teo-469050-unsplash__preview.jpg	\N		\N	t	t	139	1	85	85	\N
en	t	Pureboost Running Shoe	Pureboost Running Shoe Size 46	Built to handle curbs, corners and uneven sidewalks, these natural running shoes have an expanded landing zone and a heel plate for added stability. A lightweight and stretchy knit upper supports your native stride.	pureboost-running-shoe	F3578646	9995	9995	3,2,1	28,27,24,17,23			1	preview\\a2\\thomas-serer-420833-unsplash__preview.jpg	\N		\N	t	t	146	1	86	86	\N
en	t	Pureboost Running Shoe	Pureboost Running Shoe Size 40	Built to handle curbs, corners and uneven sidewalks, these natural running shoes have an expanded landing zone and a heel plate for added stability. A lightweight and stretchy knit upper supports your native stride.	pureboost-running-shoe	F3578640	9995	9995	3,2,1	28,27,24,17,23			1	preview\\a2\\thomas-serer-420833-unsplash__preview.jpg	\N		\N	t	t	143	1	86	86	\N
en	t	Curvy Monitor	Curvy Monitor 27 inch	Discover a truly immersive viewing experience with this monitor curved more deeply than any other. Wrapping around your field of vision the 1,800 R screencreates a wider field of view, enhances depth perception, and minimises peripheral distractions to draw you deeper in to your content.	curvy-monitor	C27F390	16994	16994	2,1	5,1,2	12,11	computers-2,electronics-2	1	preview\\9c\\alexandru-acea-686569-unsplash__preview.jpg	\N		\N	t	t	98	1	59	59	\N
en	t	Allstar Sneakers	Allstar Sneakers Size 42	All Star is the most iconic sneaker in the world, recognised for its unmistakable silhouette, star-centred ankle patch and cultural authenticity. And like the best paradigms, it only gets better with time.	allstar-sneakers	CAS23342	6500	6500	3,2,1	27,29,17,23	10,8	footwear,sports-outdoor	1	preview\\aa\\mitch-lensink-256007-unsplash__preview.jpg	\N		\N	t	t	64	1	34	34	\N
en	t	Pureboost Running Shoe	Pureboost Running Shoe Size 44	Built to handle curbs, corners and uneven sidewalks, these natural running shoes have an expanded landing zone and a heel plate for added stability. A lightweight and stretchy knit upper supports your native stride.	pureboost-running-shoe	F3578644	9995	9995	3,2,1	28,27,24,17,23			1	preview\\a2\\thomas-serer-420833-unsplash__preview.jpg	\N		\N	t	t	145	1	86	86	\N
en	t	Gaming PC	Gaming PC i7-8700 120GB SSD	This pc is optimised for gaming, and is also VR ready. The Intel Core-i7 CPU and High Performance GPU give the computer the raw power it needs to function at a high level.	gaming-pc	CGS480VR1065	93120	93120	2,1	7,1,2	12,11	computers-2,electronics-2	1	preview\\5a\\florian-olivo-1166419-unsplash__preview.jpg	\N		\N	t	t	104	1	61	61	\N
en	t	Gaming PC	Gaming PC i7-8700 240GB SSD	This pc is optimised for gaming, and is also VR ready. The Intel Core-i7 CPU and High Performance GPU give the computer the raw power it needs to function at a high level.	gaming-pc	CGS480VR1063	108720	108720	2,1	7,1,2	12,11	computers-2,electronics-2	1	preview\\5a\\florian-olivo-1166419-unsplash__preview.jpg	\N		\N	t	t	102	1	61	61	\N
en	t	Laptop	Laptop 15 inch 8GB	Now equipped with seventh-generation Intel Core processors, Laptop is snappier than ever. From daily tasks like launching apps and opening files to more advanced computing, you can power through your day thanks to faster SSDs and Turbo Boost processing up to 3.6GHz.	laptop	L2201508	139900	139900	2,1	3,1,2	12,11,3,2	computers-2,electronics-2,computers,electronics	1	preview\\71\\derick-david-409858-unsplash__preview.jpg	\N		\N	t	t	2	1	1	1	\N
en	t	Ultraboost Running Shoe	Ultraboost Running Shoe Size 46	With its ultra-light, uber-responsive magic foam and a carbon fiber plate that feels like itΓÇÖs propelling you forward, the Running Shoe is ready to push you to victories both large and small	ultraboost-running-shoe	RS0046	9999	9999	3,2,1	25,26,24,17,23	10,8	footwear,sports-outdoor	1	preview\\ed\\chuttersnap-584518-unsplash__preview.jpg	\N		\N	t	t	46	1	29	29	\N
en	t	Gaming PC	Gaming PC R7-2700 240GB SSD	This pc is optimised for gaming, and is also VR ready. The Intel Core-i7 CPU and High Performance GPU give the computer the raw power it needs to function at a high level.	gaming-pc	CGS480VR1064	109995	109995	2,1	7,1,2	12,11,3,2	computers-2,electronics-2,computers,electronics	1	preview\\5a\\florian-olivo-1166419-unsplash__preview.jpg	\N		\N	t	t	15	1	7	7	\N
en	t	Boxing Gloves	Boxing Gloves	Training gloves designed for optimum training. Our gloves promote proper punching technique because they are conformed to the natural shape of your fist. Dense, innovative two-layer foam provides better shock absorbency and full padding on the front, back and wrist to promote proper punching technique.	boxing-gloves	B000ZYLPPU	3304	3304	2,1	20,17,18			1	preview\\4f\\neonbrand-428982-unsplash__preview.jpg	\N		\N	t	t	125	1	77	77	\N
en	t	Hi-Top Basketball Shoe	Hi-Top Basketball Shoe Size 42	Boasting legendary performance since 2008, the Hyperdunkz Basketball Shoe needs no gimmicks to stand out. Air units deliver best-in-class cushioning, while a dynamic lacing system keeps your foot snug and secure, so you can focus on your game and nothing else.	hi-top-basketball-shoe	AO7893-42	14000	14000	3,2,1	28,21,17,23			1	preview\\3c\\xavier-teo-469050-unsplash__preview.jpg	\N		\N	t	t	140	1	85	85	\N
en	t	Allstar Sneakers	Allstar Sneakers Size 44	All Star is the most iconic sneaker in the world, recognised for its unmistakable silhouette, star-centred ankle patch and cultural authenticity. And like the best paradigms, it only gets better with time.	allstar-sneakers	CAS23344	6500	6500	3,2,1	27,29,17,23			1	preview\\aa\\mitch-lensink-256007-unsplash__preview.jpg	\N		\N	t	t	153	1	88	88	\N
en	t	Pureboost Running Shoe	Pureboost Running Shoe Size 42	Built to handle curbs, corners and uneven sidewalks, these natural running shoes have an expanded landing zone and a heel plate for added stability. A lightweight and stretchy knit upper supports your native stride.	pureboost-running-shoe	F3578642	9995	9995	3,2,1	28,27,24,17,23	10,8	footwear,sports-outdoor	1	preview\\a2\\thomas-serer-420833-unsplash__preview.jpg	\N		\N	t	t	56	1	32	32	\N
en	t	Football	Football	This football features high-contrast graphics for high-visibility during play, while its machine-stitched tpu casing offers consistent performance.	football	SC3137-056	5707	5707	2,1	21,17,18	9,8	equipment,sports-outdoor	1	preview\\d6\\nik-shuliahin-619349-unsplash__preview.jpg	\N		\N	t	t	40	1	26	26	\N
en	t	Road Bike	Road Bike	Featuring a full carbon chassis - complete with cyclocross-specific carbon fork - and a component setup geared for hard use on the race circuit, it's got the low weight, exceptional efficiency and brilliant handling you'll need to stay at the front of the pack.	road-bike	RB000844334	249900	249900	2,1	19,17,18			1	preview\\2f\\mikkel-bech-748940-unsplash__preview.jpg	\N		\N	t	t	123	1	75	75	\N
en	t	High Performance RAM	High Performance RAM 16GB	Each RAM module is built with a pure aluminium heat spreader for faster heat dissipation and cooler operation. Enhanced to XMP 2.0 profiles for better overclocking; Compatibility: Intel 100 Series, Intel 200 Series, Intel 300 Series, Intel X299, AMD 300 Series, AMD 400 Series.	high-performance-ram	CMK32GX4M2AC16	28181	28181	2,1	6,1,2	12,11,3,2	computers-2,electronics-2,computers,electronics	1	preview\\58\\liam-briese-1128307-unsplash__preview.jpg	\N		\N	t	t	13	1	6	6	\N
en	t	Laptop	Laptop 13 inch 16GB	Now equipped with seventh-generation Intel Core processors, Laptop is snappier than ever. From daily tasks like launching apps and opening files to more advanced computing, you can power through your day thanks to faster SSDs and Turbo Boost processing up to 3.6GHz.	laptop	L2201316	219900	219900	2,1	3,1,2	12,11	computers-2,electronics-2	1	preview\\71\\derick-david-409858-unsplash__preview.jpg	\N		\N	t	t	91	1	55	55	\N
en	t	Hard Drive	Hard Drive 4TB	Boost your PC storage with this internal hard drive, designed just for desktop and all-in-one PCs.	hard-drive	IHD455T4	9299	9299	2,1	8,1,2	12,11,3,2	computers-2,electronics-2,computers,electronics	1	preview\\96\\vincent-botta-736919-unsplash__preview.jpg	\N		\N	t	t	21	1	8	8	\N
en	t	Allstar Sneakers	Allstar Sneakers Size 42	All Star is the most iconic sneaker in the world, recognised for its unmistakable silhouette, star-centred ankle patch and cultural authenticity. And like the best paradigms, it only gets better with time.	allstar-sneakers	CAS23342	6500	6500	3,2,1	27,29,17,23			1	preview\\aa\\mitch-lensink-256007-unsplash__preview.jpg	\N		\N	t	t	152	1	88	88	\N
en	t	Tablet	Tablet 32GB	If the computer were invented today, what would it look like? It would be powerful enough for any task. So mobile you could take it everywhere. And so intuitive you could use it any way you wanted ΓÇö with touch, a keyboard, or even a pencil. In other words, it wouldnΓÇÖt really be a "computer." It would be Tablet.	tablet	TBL200032	32900	32900	2,1	3,1,2	12,11,3,2	computers-2,electronics-2,computers,electronics	1	preview\\b8\\kelly-sikkema-685291-unsplash__preview.jpg	\N		\N	t	t	5	1	2	2	\N
en	t	Ethernet Cable	Ethernet Cable	5m (metres) Cat.6 network cable (upwards/downwards compatible) | Patch cable | 2 RJ-45 plug | plug with bend protection mantle. High transmission speeds due to operating frequency with up to 250 MHz (in comparison to Cat.5/Cat.5e cable bandwidth of 100 MHz).	ethernet-cable	A23334x30	597	597	1	1,2	12,11	computers-2,electronics-2	1	preview\\7b\\thomas-q-1229169-unsplash__preview.jpg	\N		\N	t	t	112	1	64	64	\N
en	t	32-Inch Monitor	32-Inch Monitor	The UJ59 with Ultra HD resolution has 4x the pixels of Full HD, delivering more screen space and amazingly life-like images. That means you can view documents and webpages with less scrolling, work more comfortably with multiple windows and toolbars, and enjoy photos, videos and games in stunning 4K quality. Note: beverage not included.	32-inch-monitor	LU32J590UQUXEN	31000	31000	2,1	5,1,2	12,11	computers-2,electronics-2	1	preview\\d2\\daniel-korpai-1302051-unsplash__preview.jpg	\N		\N	t	t	96	1	58	58	\N
en	t	Hard Drive	Hard Drive 2TB	Boost your PC storage with this internal hard drive, designed just for desktop and all-in-one PCs.	hard-drive	IHD455T2	5374	5374	2,1	8,1,2	12,11	computers-2,electronics-2	1	preview\\96\\vincent-botta-736919-unsplash__preview.jpg	\N		\N	t	t	107	1	62	62	\N
en	t	Hard Drive	Hard Drive 2TB	Boost your PC storage with this internal hard drive, designed just for desktop and all-in-one PCs.	hard-drive	IHD455T2	5374	5374	2,1	8,1,2	12,11,3,2	computers-2,electronics-2,computers,electronics	1	preview\\96\\vincent-botta-736919-unsplash__preview.jpg	\N		\N	t	t	19	1	8	8	\N
en	t	Hard Drive	Hard Drive 3TB	Boost your PC storage with this internal hard drive, designed just for desktop and all-in-one PCs.	hard-drive	IHD455T3	7896	7896	2,1	8,1,2	12,11	computers-2,electronics-2	1	preview\\96\\vincent-botta-736919-unsplash__preview.jpg	\N		\N	t	t	108	1	62	62	\N
en	t	Allstar Sneakers	Allstar Sneakers Size 44	All Star is the most iconic sneaker in the world, recognised for its unmistakable silhouette, star-centred ankle patch and cultural authenticity. And like the best paradigms, it only gets better with time.	allstar-sneakers	CAS23344	6500	6500	3,2,1	27,29,17,23	10,8	footwear,sports-outdoor	1	preview\\aa\\mitch-lensink-256007-unsplash__preview.jpg	\N		\N	t	t	65	1	34	34	\N
en	t	Hi-Top Basketball Shoe	Hi-Top Basketball Shoe Size 42	Boasting legendary performance since 2008, the Hyperdunkz Basketball Shoe needs no gimmicks to stand out. Air units deliver best-in-class cushioning, while a dynamic lacing system keeps your foot snug and secure, so you can focus on your game and nothing else.	hi-top-basketball-shoe	AO7893-42	14000	14000	3,2,1	28,21,17,23	10,8	footwear,sports-outdoor	1	preview\\3c\\xavier-teo-469050-unsplash__preview.jpg	\N		\N	t	t	52	1	31	31	\N
en	t	Boxing Gloves	Boxing Gloves	Training gloves designed for optimum training. Our gloves promote proper punching technique because they are conformed to the natural shape of your fist. Dense, innovative two-layer foam provides better shock absorbency and full padding on the front, back and wrist to promote proper punching technique.	boxing-gloves	B000ZYLPPU	3304	3304	2,1	20,17,18	9,8	equipment,sports-outdoor	1	preview\\4f\\neonbrand-428982-unsplash__preview.jpg	\N		\N	t	t	37	1	23	23	\N
en	t	Nikkormat SLR Camera	Nikkormat SLR Camera	The Nikkormat FS was brought to market by Nikon in 1965. The lens is a 50mm f1.4 Nikkor. Nice glass, smooth focus and a working diaphragm. A UV filter and a Nikon front lens cap are included with the lens.	nikkormat-slr-camera	B07D33B334	61500	61500	2,1	11,1,9	13,11,4,2	camera-photo-2,electronics-2,camera-photo,electronics	1	preview\\95\\chuttersnap-324234-unsplash__preview.jpg	\N		\N	t	t	32	1	18	18	\N
en	t	Ultraboost Running Shoe	Ultraboost Running Shoe Size 44	With its ultra-light, uber-responsive magic foam and a carbon fiber plate that feels like itΓÇÖs propelling you forward, the Running Shoe is ready to push you to victories both large and small	ultraboost-running-shoe	RS0044	9999	9999	3,2,1	25,26,24,17,23			1	preview\\ed\\chuttersnap-584518-unsplash__preview.jpg	\N		\N	t	t	133	1	83	83	\N
en	t	High Performance RAM	High Performance RAM 8GB	Each RAM module is built with a pure aluminium heat spreader for faster heat dissipation and cooler operation. Enhanced to XMP 2.0 profiles for better overclocking; Compatibility: Intel 100 Series, Intel 200 Series, Intel 300 Series, Intel X299, AMD 300 Series, AMD 400 Series.	high-performance-ram	CMK32GX4M2AC08	14639	14639	2,1	6,1,2	12,11	computers-2,electronics-2	1	preview\\58\\liam-briese-1128307-unsplash__preview.jpg	\N		\N	t	t	100	1	60	60	\N
en	t	USB Cable	USB Cable	Solid conductors eliminate strand-interaction distortion and reduce jitter. As the surface is made of high-purity silver, the performance is very close to that of a solid silver cable, but priced much closer to solid copper cable.	usb-cable	USBCIN01.5MI	6900	6900	1	1,2	12,11	computers-2,electronics-2	1	preview\\64\\adam-birkett-239153-unsplash__preview.jpg	\N		\N	t	t	113	1	65	65	\N
en	t	Ethernet Cable	Ethernet Cable	5m (metres) Cat.6 network cable (upwards/downwards compatible) | Patch cable | 2 RJ-45 plug | plug with bend protection mantle. High transmission speeds due to operating frequency with up to 250 MHz (in comparison to Cat.5/Cat.5e cable bandwidth of 100 MHz).	ethernet-cable	A23334x30	597	597	1	1,2	12,11,3,2	computers-2,electronics-2,computers,electronics	1	preview\\7b\\thomas-q-1229169-unsplash__preview.jpg	\N		\N	t	t	24	1	10	10	\N
en	t	Tripod	Tripod	Capture vivid, professional-style photographs with help from this lightweight tripod. The adjustable-height tripod makes it easy to achieve reliable stability and score just the right angle when going after that award-winning shot.	tripod	B00XI87KV8	1498	1498	2,1	13,1,9	13,11	camera-photo-2,electronics-2	1	preview\\21\\zoltan-tasi-423051-unsplash__preview.jpg	\N		\N	t	t	117	1	69	69	\N
en	t	Pureboost Running Shoe	Pureboost Running Shoe Size 40	Built to handle curbs, corners and uneven sidewalks, these natural running shoes have an expanded landing zone and a heel plate for added stability. A lightweight and stretchy knit upper supports your native stride.	pureboost-running-shoe	F3578640	9995	9995	3,2,1	28,27,24,17,23	10,8	footwear,sports-outdoor	1	preview\\a2\\thomas-serer-420833-unsplash__preview.jpg	\N		\N	t	t	55	1	32	32	\N
en	t	Football	Football	This football features high-contrast graphics for high-visibility during play, while its machine-stitched tpu casing offers consistent performance.	football	SC3137-056	5707	5707	2,1	21,17,18			1	preview\\d6\\nik-shuliahin-619349-unsplash__preview.jpg	\N		\N	t	t	128	1	80	80	\N
en	t	Tent	Tent	With tons of space inside (for max. 4 persons), full head height throughout the entire tent and an unusual and striking shape, this tent offers you everything you need.	tent	2000023510	21493	21493	1	17,18	9,8	equipment,sports-outdoor	1	preview\\96\\michael-guite-571169-unsplash__preview.jpg	\N		\N	t	t	38	1	24	24	\N
en	t	Tennis Ball	Tennis Ball	Our dog loves these tennis balls and they last for some time before they eventually either get lost in some field or bush or the covering comes off due to it being used most of the day every day.	tennis-ball	WRT11752P	1273	1273	2,1	22,17,18			1	preview\\30\\ben-hershey-574483-unsplash__preview.jpg	\N		\N	t	t	129	1	81	81	\N
en	t	32-Inch Monitor	32-Inch Monitor	The UJ59 with Ultra HD resolution has 4x the pixels of Full HD, delivering more screen space and amazingly life-like images. That means you can view documents and webpages with less scrolling, work more comfortably with multiple windows and toolbars, and enjoy photos, videos and games in stunning 4K quality. Note: beverage not included.	32-inch-monitor	LU32J590UQUXEN	31000	31000	2,1	5,1,2	12,11,3,2	computers-2,electronics-2,computers,electronics	1	preview\\d2\\daniel-korpai-1302051-unsplash__preview.jpg	\N		\N	t	t	8	1	4	4	\N
en	t	Hard Drive	Hard Drive 6TB	Boost your PC storage with this internal hard drive, designed just for desktop and all-in-one PCs.	hard-drive	IHD455T6	13435	13435	2,1	8,1,2	12,11	computers-2,electronics-2	1	preview\\96\\vincent-botta-736919-unsplash__preview.jpg	\N		\N	t	t	110	1	62	62	\N
en	t	High Performance RAM	High Performance RAM 4GB	Each RAM module is built with a pure aluminium heat spreader for faster heat dissipation and cooler operation. Enhanced to XMP 2.0 profiles for better overclocking; Compatibility: Intel 100 Series, Intel 200 Series, Intel 300 Series, Intel X299, AMD 300 Series, AMD 400 Series.	high-performance-ram	CMK32GX4M2AC04	13785	13785	2,1	6,1,2	12,11	computers-2,electronics-2	1	preview\\58\\liam-briese-1128307-unsplash__preview.jpg	\N		\N	t	t	99	1	60	60	\N
en	t	Freerun Running Shoe	Freerun Running Shoe Size 42	The Freerun Men's Running Shoe is built for record-breaking speed. The Flyknit upper delivers ultra-lightweight support that fits like a glove.	freerun-running-shoe	AR4561-42	16000	16000	3,2,1	27,21,17,23	10,8	footwear,sports-outdoor	1	preview\\0f\\imani-clovis-234736-unsplash__preview.jpg	\N		\N	t	t	48	1	30	30	\N
en	t	Vintage Folding Camera	Vintage Folding Camera	This vintage folding camera is so antiquated that you cannot possibly hope to produce actual photographs with it. However, it makes a wonderful decorative piece for the home or office.	vintage-folding-camera	B00AFC9099	535000	535000	2,1	12,1,9	13,11,4,2	camera-photo-2,electronics-2,camera-photo,electronics	1	preview\\3c\\jonathan-talbert-697262-unsplash__preview.jpg	\N		\N	t	t	28	1	14	14	\N
en	t	Tablet	Tablet 128GB	If the computer were invented today, what would it look like? It would be powerful enough for any task. So mobile you could take it everywhere. And so intuitive you could use it any way you wanted ΓÇö with touch, a keyboard, or even a pencil. In other words, it wouldnΓÇÖt really be a "computer." It would be Tablet.	tablet	TBL200128	44500	44500	2,1	3,1,2	12,11	computers-2,electronics-2	1	preview\\b8\\kelly-sikkema-685291-unsplash__preview.jpg	\N		\N	t	t	94	1	56	56	\N
en	t	Instamatic Camera	Instamatic Camera	This inexpensive point-and-shoot camera uses easy-to-load 126 film cartridges. A built-in flash unit ensure great results, no matter the lighting conditions.	instamatic-camera	B07K1330LL	2000	2000	2,1	14,1,9	13,11,4,2	camera-photo-2,electronics-2,camera-photo,electronics	1	preview\\5b\\jakob-owens-274337-unsplash__preview.jpg	\N		\N	t	t	30	1	16	16	\N
en	t	Wireless Optical Mouse	Wireless Optical Mouse	The Logitech M185 Wireless Optical Mouse is a great device for any computer user, and as Logitech are the global market leaders for these devices, you are also guaranteed absolute reliability. A mouse to be reckoned with!	cordless-mouse	834444	1899	1899	2,1	4,1,2	12,11	computers-2,electronics-2	1	preview\\a1\\oscar-ivan-esquivel-arteaga-687447-unsplash__preview.jpg	\N		\N	t	t	95	1	57	57	\N
en	t	Twin Lens Camera	Twin Lens Camera	What makes a Rolleiflex TLR so special? Many things. To start, TLR stands for twin lens reflex. ΓÇ£TwinΓÇ¥ because there are two lenses. And reflex means that the photographer looks through the lens to view the reflected image of an object or scene on the focusing screen.	twin-lens-camera	B07D78JTLR	79900	79900	2,1	16,1,9	13,11	camera-photo-2,electronics-2	1	preview\\ef\\alexander-andrews-260988-unsplash__preview.jpg	\N		\N	t	t	122	1	74	74	\N
en	t	RunX Running Shoe	RunX Running Shoe Size 46	These running shoes are made with an airy, lightweight mesh upper. The durable rubber outsole grips the pavement for added stability. A cushioned midsole brings comfort to each step.	runx-running-shoe	F3633346	4495	4495	3,2,1	27,24,17,23	10,8	footwear,sports-outdoor	1	preview\\00\\nikolai-chernichenko-1299748-unsplash__preview.jpg	\N		\N	t	t	62	1	33	33	\N
en	t	Cruiser Skateboard	Cruiser Skateboard	Based on the 1970s iconic shape, but made to a larger 69cm size, with updated, quality component, these skateboards are great for beginners to learn the foot spacing required, and are perfect for all-day cruising.	cruiser-skateboard	799872520	2499	2499	1	17,18			1	preview\\35\\max-tarkhov-737999-unsplash__preview.jpg	\N		\N	t	t	127	1	79	79	\N
en	t	Curvy Monitor	Curvy Monitor 24 inch	Discover a truly immersive viewing experience with this monitor curved more deeply than any other. Wrapping around your field of vision the 1,800 R screencreates a wider field of view, enhances depth perception, and minimises peripheral distractions to draw you deeper in to your content.	curvy-monitor	C24F390	14374	14374	2,1	5,1,2	12,11	computers-2,electronics-2	1	preview\\9c\\alexandru-acea-686569-unsplash__preview.jpg	\N		\N	t	t	97	1	59	59	\N
en	t	Instant Camera	Instant Camera	With its nostalgic design and simple point-and-shoot functionality, the Instant Camera is the perfect pick to get started with instant photography.	instant-camera	IC22MWDD	17499	17499	2,1	10,1,9	13,11	camera-photo-2,electronics-2	1	preview\\b5\\eniko-kis-663725-unsplash__preview.jpg	\N		\N	t	t	114	1	66	66	\N
en	t	Tent	Tent	With tons of space inside (for max. 4 persons), full head height throughout the entire tent and an unusual and striking shape, this tent offers you everything you need.	tent	2000023510	21493	21493	1	17,18			1	preview\\96\\michael-guite-571169-unsplash__preview.jpg	\N		\N	t	t	126	1	78	78	\N
en	t	Ultraboost Running Shoe	Ultraboost Running Shoe Size 42	With its ultra-light, uber-responsive magic foam and a carbon fiber plate that feels like itΓÇÖs propelling you forward, the Running Shoe is ready to push you to victories both large and small	ultraboost-running-shoe	RS0042	9999	9999	3,2,1	25,26,24,17,23			1	preview\\ed\\chuttersnap-584518-unsplash__preview.jpg	\N		\N	t	t	132	1	83	83	\N
en	t	Freerun Running Shoe	Freerun Running Shoe Size 46	The Freerun Men's Running Shoe is built for record-breaking speed. The Flyknit upper delivers ultra-lightweight support that fits like a glove.	freerun-running-shoe	AR4561-46	16000	16000	3,2,1	27,21,17,23	10,8	footwear,sports-outdoor	1	preview\\0f\\imani-clovis-234736-unsplash__preview.jpg	\N		\N	t	t	50	1	30	30	\N
en	t	Hi-Top Basketball Shoe	Hi-Top Basketball Shoe Size 40	Boasting legendary performance since 2008, the Hyperdunkz Basketball Shoe needs no gimmicks to stand out. Air units deliver best-in-class cushioning, while a dynamic lacing system keeps your foot snug and secure, so you can focus on your game and nothing else.	hi-top-basketball-shoe	AO7893-40	14000	14000	3,2,1	28,21,17,23	10,8	footwear,sports-outdoor	1	preview\\3c\\xavier-teo-469050-unsplash__preview.jpg	\N		\N	t	t	51	1	31	31	\N
en	t	Basketball	Basketball	The Wilson MVP ball is perfect for playing basketball, and improving your skill for hours on end. Designed for new players, it is created with a high-quality rubber suitable for courts, allowing you to get full use during your practices.	basketball	WTB1418XB06	3562	3562	2,1	22,17,18	9,8	equipment,sports-outdoor	1	preview\\0f\\tommy-bebo-600358-unsplash__preview.jpg	\N		\N	t	t	42	1	28	28	\N
en	t	Laptop	Laptop 15 inch 8GB	Now equipped with seventh-generation Intel Core processors, Laptop is snappier than ever. From daily tasks like launching apps and opening files to more advanced computing, you can power through your day thanks to faster SSDs and Turbo Boost processing up to 3.6GHz.	laptop	L2201508	139900	139900	2,1	3,1,2	12,11	computers-2,electronics-2	1	preview\\71\\derick-david-409858-unsplash__preview.jpg	\N		\N	t	t	90	1	55	55	\N
en	t	Ultraboost Running Shoe	Ultraboost Running Shoe Size 46	With its ultra-light, uber-responsive magic foam and a carbon fiber plate that feels like itΓÇÖs propelling you forward, the Running Shoe is ready to push you to victories both large and small	ultraboost-running-shoe	RS0046	9999	9999	3,2,1	25,26,24,17,23			1	preview\\ed\\chuttersnap-584518-unsplash__preview.jpg	\N		\N	t	t	134	1	83	83	\N
en	t	RunX Running Shoe	RunX Running Shoe Size 40	These running shoes are made with an airy, lightweight mesh upper. The durable rubber outsole grips the pavement for added stability. A cushioned midsole brings comfort to each step.	runx-running-shoe	F3633340	4495	4495	3,2,1	27,24,17,23	10,8	footwear,sports-outdoor	1	preview\\00\\nikolai-chernichenko-1299748-unsplash__preview.jpg	\N		\N	t	t	59	1	33	33	\N
en	t	Vintage Folding Camera	Vintage Folding Camera	This vintage folding camera is so antiquated that you cannot possibly hope to produce actual photographs with it. However, it makes a wonderful decorative piece for the home or office.	vintage-folding-camera	B00AFC9099	535000	535000	2,1	12,1,9	13,11	camera-photo-2,electronics-2	1	preview\\3c\\jonathan-talbert-697262-unsplash__preview.jpg	\N		\N	t	t	116	1	68	68	\N
en	t	Tablet	Tablet 128GB	If the computer were invented today, what would it look like? It would be powerful enough for any task. So mobile you could take it everywhere. And so intuitive you could use it any way you wanted ΓÇö with touch, a keyboard, or even a pencil. In other words, it wouldnΓÇÖt really be a "computer." It would be Tablet.	tablet	TBL200128	44500	44500	2,1	3,1,2	12,11,3,2	computers-2,electronics-2,computers,electronics	1	preview\\b8\\kelly-sikkema-685291-unsplash__preview.jpg	\N		\N	t	t	6	1	2	2	\N
en	t	Tripod	Tripod	Capture vivid, professional-style photographs with help from this lightweight tripod. The adjustable-height tripod makes it easy to achieve reliable stability and score just the right angle when going after that award-winning shot.	tripod	B00XI87KV8	1498	1498	2,1	13,1,9	13,11,4,2	camera-photo-2,electronics-2,camera-photo,electronics	1	preview\\21\\zoltan-tasi-423051-unsplash__preview.jpg	\N		\N	t	t	29	1	15	15	\N
en	t	Tennis Ball	Tennis Ball	Our dog loves these tennis balls and they last for some time before they eventually either get lost in some field or bush or the covering comes off due to it being used most of the day every day.	tennis-ball	WRT11752P	1273	1273	2,1	22,17,18	9,8	equipment,sports-outdoor	1	preview\\30\\ben-hershey-574483-unsplash__preview.jpg	\N		\N	t	t	41	1	27	27	\N
en	t	Hi-Top Basketball Shoe	Hi-Top Basketball Shoe Size 44	Boasting legendary performance since 2008, the Hyperdunkz Basketball Shoe needs no gimmicks to stand out. Air units deliver best-in-class cushioning, while a dynamic lacing system keeps your foot snug and secure, so you can focus on your game and nothing else.	hi-top-basketball-shoe	AO7893-44	14000	14000	3,2,1	28,21,17,23			1	preview\\3c\\xavier-teo-469050-unsplash__preview.jpg	\N		\N	t	t	141	1	85	85	\N
en	t	Freerun Running Shoe	Freerun Running Shoe Size 46	The Freerun Men's Running Shoe is built for record-breaking speed. The Flyknit upper delivers ultra-lightweight support that fits like a glove.	freerun-running-shoe	AR4561-46	16000	16000	3,2,1	27,21,17,23			1	preview\\0f\\imani-clovis-234736-unsplash__preview.jpg	\N		\N	t	t	138	1	84	84	\N
en	t	Gaming PC	Gaming PC i7-8700 120GB SSD	This pc is optimised for gaming, and is also VR ready. The Intel Core-i7 CPU and High Performance GPU give the computer the raw power it needs to function at a high level.	gaming-pc	CGS480VR1065	93120	93120	2,1	7,1,2	12,11,3,2	computers-2,electronics-2,computers,electronics	1	preview\\5a\\florian-olivo-1166419-unsplash__preview.jpg	\N		\N	t	t	16	1	7	7	\N
en	t	Hi-Top Basketball Shoe	Hi-Top Basketball Shoe Size 46	Boasting legendary performance since 2008, the Hyperdunkz Basketball Shoe needs no gimmicks to stand out. Air units deliver best-in-class cushioning, while a dynamic lacing system keeps your foot snug and secure, so you can focus on your game and nothing else.	hi-top-basketball-shoe	AO7893-46	14000	14000	3,2,1	28,21,17,23	10,8	footwear,sports-outdoor	1	preview\\3c\\xavier-teo-469050-unsplash__preview.jpg	\N		\N	t	t	54	1	31	31	\N
en	t	Gaming PC	Gaming PC R7-2700 240GB SSD	This pc is optimised for gaming, and is also VR ready. The Intel Core-i7 CPU and High Performance GPU give the computer the raw power it needs to function at a high level.	gaming-pc	CGS480VR1064	109995	109995	2,1	7,1,2	12,11	computers-2,electronics-2	1	preview\\5a\\florian-olivo-1166419-unsplash__preview.jpg	\N		\N	t	t	103	1	61	61	\N
en	t	Camera Lens	Camera Lens	This lens is a Di type lens using an optical system with improved multi-coating designed to function with digital SLR cameras as well as film cameras.	camera-lens	B0012UUP02	10400	10400	2,1	11,1,9	13,11	camera-photo-2,electronics-2	1	preview\\9b\\brandi-redd-104140-unsplash__preview.jpg	\N		\N	t	t	115	1	67	67	\N
en	t	RunX Running Shoe	RunX Running Shoe Size 42	These running shoes are made with an airy, lightweight mesh upper. The durable rubber outsole grips the pavement for added stability. A cushioned midsole brings comfort to each step.	runx-running-shoe	F3633342	4495	4495	3,2,1	27,24,17,23			1	preview\\00\\nikolai-chernichenko-1299748-unsplash__preview.jpg	\N		\N	t	t	148	1	87	87	\N
en	t	Skipping Rope	Skipping Rope	When you're working out you need a quality rope that doesn't tangle at every couple of jumps and with this skipping rope you won't have this problem. The fact that it looks like a pair of tasty frankfurters is merely a bonus.	skipping-rope	B07CNGXVXT	799	799	2,1	20,17,18	9,8	equipment,sports-outdoor	1	preview\\34\\stoica-ionela-530966-unsplash__preview.jpg	\N		\N	t	t	36	1	22	22	\N
en	t	Laptop	Laptop 15 inch 16GB	Now equipped with seventh-generation Intel Core processors, Laptop is snappier than ever. From daily tasks like launching apps and opening files to more advanced computing, you can power through your day thanks to faster SSDs and Turbo Boost processing up to 3.6GHz.	laptop	L2201516	229900	229900	2,1	3,1,2	12,11,3,2	computers-2,electronics-2,computers,electronics	1	preview\\71\\derick-david-409858-unsplash__preview.jpg	\N		\N	t	t	4	1	1	1	\N
en	t	Hi-Top Basketball Shoe	Hi-Top Basketball Shoe Size 44	Boasting legendary performance since 2008, the Hyperdunkz Basketball Shoe needs no gimmicks to stand out. Air units deliver best-in-class cushioning, while a dynamic lacing system keeps your foot snug and secure, so you can focus on your game and nothing else.	hi-top-basketball-shoe	AO7893-44	14000	14000	3,2,1	28,21,17,23	10,8	footwear,sports-outdoor	1	preview\\3c\\xavier-teo-469050-unsplash__preview.jpg	\N		\N	t	t	53	1	31	31	\N
en	t	Laptop	Laptop 15 inch 16GB	Now equipped with seventh-generation Intel Core processors, Laptop is snappier than ever. From daily tasks like launching apps and opening files to more advanced computing, you can power through your day thanks to faster SSDs and Turbo Boost processing up to 3.6GHz.	laptop	L2201516	229900	229900	2,1	3,1,2	12,11	computers-2,electronics-2	1	preview\\71\\derick-david-409858-unsplash__preview.jpg	\N		\N	t	t	92	1	55	55	\N
en	t	Clacky Keyboard	Clacky Keyboard	Let all your colleagues know that you are typing on this exclusive, colorful klicky-klacky keyboard. Huge travel on each keypress ensures maximum klack on each and every keystroke.	clacky-keyboard	A4TKLA45535	7489	7489	2,1	6,1,2	12,11,3,2	computers-2,electronics-2,computers,electronics	1	preview\\09\\juan-gomez-674574-unsplash__preview.jpg	\N		\N	t	t	23	1	9	9	\N
en	t	Ultraboost Running Shoe	Ultraboost Running Shoe Size 42	With its ultra-light, uber-responsive magic foam and a carbon fiber plate that feels like itΓÇÖs propelling you forward, the Running Shoe is ready to push you to victories both large and small	ultraboost-running-shoe	RS0042	9999	9999	3,2,1	25,26,24,17,23	10,8	footwear,sports-outdoor	1	preview\\ed\\chuttersnap-584518-unsplash__preview.jpg	\N		\N	t	t	44	1	29	29	\N
en	t	Pureboost Running Shoe	Pureboost Running Shoe Size 46	Built to handle curbs, corners and uneven sidewalks, these natural running shoes have an expanded landing zone and a heel plate for added stability. A lightweight and stretchy knit upper supports your native stride.	pureboost-running-shoe	F3578646	9995	9995	3,2,1	28,27,24,17,23	10,8	footwear,sports-outdoor	1	preview\\a2\\thomas-serer-420833-unsplash__preview.jpg	\N		\N	t	t	58	1	32	32	\N
en	t	Laptop	Laptop 13 inch 8GB	Now equipped with seventh-generation Intel Core processors, Laptop is snappier than ever. From daily tasks like launching apps and opening files to more advanced computing, you can power through your day thanks to faster SSDs and Turbo Boost processing up to 3.6GHz.	laptop	L2201308	129900	129900	2,1	3,1,2	12,11,3,2	computers-2,electronics-2,computers,electronics	1	preview\\71\\derick-david-409858-unsplash__preview.jpg	\N		\N	t	t	1	1	1	1	\N
en	t	Clacky Keyboard	Clacky Keyboard	Let all your colleagues know that you are typing on this exclusive, colorful klicky-klacky keyboard. Huge travel on each keypress ensures maximum klack on each and every keystroke.	clacky-keyboard	A4TKLA45535	7489	7489	2,1	6,1,2	12,11	computers-2,electronics-2	1	preview\\09\\juan-gomez-674574-unsplash__preview.jpg	\N		\N	t	t	111	1	63	63	\N
en	t	Freerun Running Shoe	Freerun Running Shoe Size 44	The Freerun Men's Running Shoe is built for record-breaking speed. The Flyknit upper delivers ultra-lightweight support that fits like a glove.	freerun-running-shoe	AR4561-44	16000	16000	3,2,1	27,21,17,23	10,8	footwear,sports-outdoor	1	preview\\0f\\imani-clovis-234736-unsplash__preview.jpg	\N		\N	t	t	49	1	30	30	\N
en	t	Hard Drive	Hard Drive 6TB	Boost your PC storage with this internal hard drive, designed just for desktop and all-in-one PCs.	hard-drive	IHD455T6	13435	13435	2,1	8,1,2	12,11,3,2	computers-2,electronics-2,computers,electronics	1	preview\\96\\vincent-botta-736919-unsplash__preview.jpg	\N		\N	t	t	22	1	8	8	\N
en	t	Ultraboost Running Shoe	Ultraboost Running Shoe Size 44	With its ultra-light, uber-responsive magic foam and a carbon fiber plate that feels like itΓÇÖs propelling you forward, the Running Shoe is ready to push you to victories both large and small	ultraboost-running-shoe	RS0044	9999	9999	3,2,1	25,26,24,17,23	10,8	footwear,sports-outdoor	1	preview\\ed\\chuttersnap-584518-unsplash__preview.jpg	\N		\N	t	t	45	1	29	29	\N
en	t	RunX Running Shoe	RunX Running Shoe Size 42	These running shoes are made with an airy, lightweight mesh upper. The durable rubber outsole grips the pavement for added stability. A cushioned midsole brings comfort to each step.	runx-running-shoe	F3633342	4495	4495	3,2,1	27,24,17,23	10,8	footwear,sports-outdoor	1	preview\\00\\nikolai-chernichenko-1299748-unsplash__preview.jpg	\N		\N	t	t	60	1	33	33	\N
en	t	Gaming PC	Gaming PC R7-2700 120GB SSD	This pc is optimised for gaming, and is also VR ready. The Intel Core-i7 CPU and High Performance GPU give the computer the raw power it needs to function at a high level.	gaming-pc	CGS480VR1066	94920	94920	2,1	7,1,2	12,11	computers-2,electronics-2	1	preview\\5a\\florian-olivo-1166419-unsplash__preview.jpg	\N		\N	t	t	105	1	61	61	\N
en	t	Skipping Rope	Skipping Rope	When you're working out you need a quality rope that doesn't tangle at every couple of jumps and with this skipping rope you won't have this problem. The fact that it looks like a pair of tasty frankfurters is merely a bonus.	skipping-rope	B07CNGXVXT	799	799	2,1	20,17,18			1	preview\\34\\stoica-ionela-530966-unsplash__preview.jpg	\N		\N	t	t	124	1	76	76	\N
en	t	Ultraboost Running Shoe	Ultraboost Running Shoe Size 40	With its ultra-light, uber-responsive magic foam and a carbon fiber plate that feels like itΓÇÖs propelling you forward, the Running Shoe is ready to push you to victories both large and small	ultraboost-running-shoe	RS0040	9999	9999	3,2,1	25,26,24,17,23	10,8	footwear,sports-outdoor	1	preview\\ed\\chuttersnap-584518-unsplash__preview.jpg	\N		\N	t	t	43	1	29	29	\N
en	t	Laptop	Laptop 13 inch 16GB	Now equipped with seventh-generation Intel Core processors, Laptop is snappier than ever. From daily tasks like launching apps and opening files to more advanced computing, you can power through your day thanks to faster SSDs and Turbo Boost processing up to 3.6GHz.	laptop	L2201316	219900	219900	2,1	3,1,2	12,11,3,2	computers-2,electronics-2,computers,electronics	1	preview\\71\\derick-david-409858-unsplash__preview.jpg	\N		\N	t	t	3	1	1	1	\N
en	t	RunX Running Shoe	RunX Running Shoe Size 44	These running shoes are made with an airy, lightweight mesh upper. The durable rubber outsole grips the pavement for added stability. A cushioned midsole brings comfort to each step.	runx-running-shoe	F3633344	4495	4495	3,2,1	27,24,17,23	10,8	footwear,sports-outdoor	1	preview\\00\\nikolai-chernichenko-1299748-unsplash__preview.jpg	\N		\N	t	t	61	1	33	33	\N
en	t	Gaming PC	Gaming PC i7-8700 240GB SSD	This pc is optimised for gaming, and is also VR ready. The Intel Core-i7 CPU and High Performance GPU give the computer the raw power it needs to function at a high level.	gaming-pc	CGS480VR1063	108720	108720	2,1	7,1,2	12,11,3,2	computers-2,electronics-2,computers,electronics	1	preview\\5a\\florian-olivo-1166419-unsplash__preview.jpg	\N		\N	t	t	14	1	7	7	\N
en	t	RunX Running Shoe	RunX Running Shoe Size 40	These running shoes are made with an airy, lightweight mesh upper. The durable rubber outsole grips the pavement for added stability. A cushioned midsole brings comfort to each step.	runx-running-shoe	F3633340	4495	4495	3,2,1	27,24,17,23			1	preview\\00\\nikolai-chernichenko-1299748-unsplash__preview.jpg	\N		\N	t	t	147	1	87	87	\N
en	t	Compact SLR Camera	Compact SLR Camera	Retro styled, portable in size and built around a powerful 24-megapixel APS-C CMOS sensor, this digital camera is the ideal companion for creative everyday photography. Packed full of high spec features such as an advanced hybrid autofocus system able to keep pace with even the most active subjects, a speedy 6fps continuous-shooting mode, high-resolution electronic viewfinder and intuitive swivelling touchscreen, it brings professional image making into everyoneΓÇÖs grasp.	compact-slr-camera	B07D75V44S	52100	52100	1	1,9	13,11	camera-photo-2,electronics-2	1	preview\\9d\\robert-shunev-528016-unsplash__preview.jpg	\N		\N	t	t	121	1	73	73	\N
en	t	Allstar Sneakers	Allstar Sneakers Size 46	All Star is the most iconic sneaker in the world, recognised for its unmistakable silhouette, star-centred ankle patch and cultural authenticity. And like the best paradigms, it only gets better with time.	allstar-sneakers	CAS23346	6500	6500	3,2,1	27,29,17,23			1	preview\\aa\\mitch-lensink-256007-unsplash__preview.jpg	\N		\N	t	t	154	1	88	88	\N
en	t	Road Bike	Road Bike	Featuring a full carbon chassis - complete with cyclocross-specific carbon fork - and a component setup geared for hard use on the race circuit, it's got the low weight, exceptional efficiency and brilliant handling you'll need to stay at the front of the pack.	road-bike	RB000844334	249900	249900	2,1	19,17,18	9,8	equipment,sports-outdoor	1	preview\\2f\\mikkel-bech-748940-unsplash__preview.jpg	\N		\N	t	t	35	1	21	21	\N
en	t	RunX Running Shoe	RunX Running Shoe Size 46	These running shoes are made with an airy, lightweight mesh upper. The durable rubber outsole grips the pavement for added stability. A cushioned midsole brings comfort to each step.	runx-running-shoe	F3633346	4495	4495	3,2,1	27,24,17,23			1	preview\\00\\nikolai-chernichenko-1299748-unsplash__preview.jpg	\N		\N	t	t	150	1	87	87	\N
en	t	Allstar Sneakers	Allstar Sneakers Size 40	All Star is the most iconic sneaker in the world, recognised for its unmistakable silhouette, star-centred ankle patch and cultural authenticity. And like the best paradigms, it only gets better with time.	allstar-sneakers	CAS23340	6500	6500	3,2,1	27,29,17,23	10,8	footwear,sports-outdoor	1	preview\\aa\\mitch-lensink-256007-unsplash__preview.jpg	\N		\N	t	t	63	1	34	34	\N
en	t	Curvy Monitor	Curvy Monitor 24 inch	Discover a truly immersive viewing experience with this monitor curved more deeply than any other. Wrapping around your field of vision the 1,800 R screencreates a wider field of view, enhances depth perception, and minimises peripheral distractions to draw you deeper in to your content.	curvy-monitor	C24F390	14374	14374	2,1	5,1,2	12,11,3,2	computers-2,electronics-2,computers,electronics	1	preview\\9c\\alexandru-acea-686569-unsplash__preview.jpg	\N		\N	t	t	9	1	5	5	\N
en	t	Instamatic Camera	Instamatic Camera	This inexpensive point-and-shoot camera uses easy-to-load 126 film cartridges. A built-in flash unit ensure great results, no matter the lighting conditions.	instamatic-camera	B07K1330LL	2000	2000	2,1	14,1,9	13,11	camera-photo-2,electronics-2	1	preview\\5b\\jakob-owens-274337-unsplash__preview.jpg	\N		\N	t	t	118	1	70	70	\N
en	t	Basketball	Basketball	The Wilson MVP ball is perfect for playing basketball, and improving your skill for hours on end. Designed for new players, it is created with a high-quality rubber suitable for courts, allowing you to get full use during your practices.	basketball	WTB1418XB06	3562	3562	2,1	22,17,18			1	preview\\0f\\tommy-bebo-600358-unsplash__preview.jpg	\N		\N	t	t	130	1	82	82	\N
en	t	Pureboost Running Shoe	Pureboost Running Shoe Size 42	Built to handle curbs, corners and uneven sidewalks, these natural running shoes have an expanded landing zone and a heel plate for added stability. A lightweight and stretchy knit upper supports your native stride.	pureboost-running-shoe	F3578642	9995	9995	3,2,1	28,27,24,17,23			1	preview\\a2\\thomas-serer-420833-unsplash__preview.jpg	\N		\N	t	t	144	1	86	86	\N
en	t	Wireless Optical Mouse	Wireless Optical Mouse	The Logitech M185 Wireless Optical Mouse is a great device for any computer user, and as Logitech are the global market leaders for these devices, you are also guaranteed absolute reliability. A mouse to be reckoned with!	cordless-mouse	834444	1899	1899	2,1	4,1,2	12,11,3,2	computers-2,electronics-2,computers,electronics	1	preview\\a1\\oscar-ivan-esquivel-arteaga-687447-unsplash__preview.jpg	\N		\N	t	t	7	1	3	3	\N
en	t	Modern Cafe Chair	Modern Cafe Chair mint	You sit comfortably thanks to the restful flexibility of the seat. Lightweight and easy to move around, yet stable enough even for the liveliest, young family members.	modern-cafe-chair	404.038.96	10000	10000	3,1	39,30,34	15,14,6,5	furniture-2,home-garden-2,furniture,home-garden	1	preview\\b1\\jean-philippe-delberghe-1400011-unsplash__preview.jpg	\N		\N	t	t	87	1	54	54	\N
en	t	Modern Cafe Chair	Modern Cafe Chair pearl	You sit comfortably thanks to the restful flexibility of the seat. Lightweight and easy to move around, yet stable enough even for the liveliest, young family members.	modern-cafe-chair	404.038.96	10000	10000	3,1	28,30,34	15,14,6,5	furniture-2,home-garden-2,furniture,home-garden	1	preview\\b1\\jean-philippe-delberghe-1400011-unsplash__preview.jpg	\N		\N	t	t	88	1	54	54	\N
en	t	Modern Cafe Chair	Modern Cafe Chair mustard	You sit comfortably thanks to the restful flexibility of the seat. Lightweight and easy to move around, yet stable enough even for the liveliest, young family members.	modern-cafe-chair	404.038.96	10000	10000	3,1	38,30,34	15,14	furniture-2,home-garden-2	1	preview\\b1\\jean-philippe-delberghe-1400011-unsplash__preview.jpg	\N		\N	t	t	174	1	108	108	\N
en	t	Modern Cafe Chair	Modern Cafe Chair mint	You sit comfortably thanks to the restful flexibility of the seat. Lightweight and easy to move around, yet stable enough even for the liveliest, young family members.	modern-cafe-chair	404.038.96	10000	10000	3,1	39,30,34	15,14	furniture-2,home-garden-2	1	preview\\b1\\jean-philippe-delberghe-1400011-unsplash__preview.jpg	\N		\N	t	t	175	1	108	108	\N
en	t	Modern Cafe Chair	Modern Cafe Chair pearl	You sit comfortably thanks to the restful flexibility of the seat. Lightweight and easy to move around, yet stable enough even for the liveliest, young family members.	modern-cafe-chair	404.038.96	10000	10000	3,1	28,30,34	15,14	furniture-2,home-garden-2	1	preview\\b1\\jean-philippe-delberghe-1400011-unsplash__preview.jpg	\N		\N	t	t	176	1	108	108	\N
en	t	Comfy Padded Chair	Comfy Padded Chair	You sit comfortably thanks to the shaped back. The chair frame is made of solid wood, which is a durable natural material.	comfy-padded-chair	404.068.14	13000	13000	3,1	35,30,34	15,14,6,5	furniture-2,home-garden-2,furniture,home-garden	1	preview\\3b\\kari-shea-398668-unsplash__preview.jpg	\N		\N	t	t	82	1	50	50	\N
en	t	Light Shade	Light Shade	Modern tapered white polycotton pendant shade with a metallic silver chrome interior finish for maximum light reflection. Reversible gimble so it can be used as a ceiling shade or as a lamp shade.	light-shade	B45809LSW	2845	2845	1	30,34	15,14	furniture-2,home-garden-2	1	preview\\5f\\pierre-chatel-innocenti-483198-unsplash__preview.jpg	\N		\N	t	t	168	1	102	102	\N
en	t	Assorted Indoor Succulents	Assorted Indoor Succulents	These assorted succulents come in a variety of different shapes and colours - each with their own unique personality. Succulents grow best in plenty of light: a sunny windowsill would be the ideal spot for them to thrive!	assorted-succulents	A08593	3250	3250	5,1	40,30,31	16,14	plants-2,home-garden-2	1	preview\\81\\annie-spratt-78044-unsplash__preview.jpg	\N		\N	t	t	160	1	94	94	\N
en	t	Leather Sofa	Leather Sofa	This premium, tan-brown bonded leather seat is part of the 'chill' sofa range. The lever activated recline feature makes it easy to adjust to any position. This smart, bustle back design with rounded tight padded arms has been designed with your comfort in mind. This well-padded chair has foam pocket sprung seat cushions and fibre-filled back cushions.	leather-sofa	CH00001-02	124500	124500	3,1	36,30,34	15,14	furniture-2,home-garden-2	1	preview\\3e\\paul-weaver-1120584-unsplash__preview.jpg	\N		\N	t	t	167	1	101	101	\N
en	t	Guardian Lion Statue	Guardian Lion Statue	Placing it at home or office can bring you fortune and prosperity, guard your house and ward off ill fortune.	guardian-lion-statue	GL34LLW11	18853	18853	3,1	35,30,34	15,14	furniture-2,home-garden-2	1	preview\\44\\vincent-liu-525429-unsplash__preview.jpg	\N		\N	t	t	163	1	97	97	\N
en	t	Fern Blechnum Gibbum	Fern Blechnum Gibbum	Create a tropical feel in your home with this lush green tree fern, it has decorative leaves and will develop a short slender trunk in time.	fern-blechnum-gibbum	A04851	895	895	4,1	33,30,31	16,14,7,5	plants-2,home-garden-2,plants,home-garden	1	preview\\6d\\caleb-george-536388-unsplash__preview.jpg	\N		\N	t	t	71	1	39	39	\N
en	t	Assorted Indoor Succulents	Assorted Indoor Succulents	These assorted succulents come in a variety of different shapes and colours - each with their own unique personality. Succulents grow best in plenty of light: a sunny windowsill would be the ideal spot for them to thrive!	assorted-succulents	A08593	3250	3250	4,1	32,30,31	16,14,7,5	plants-2,home-garden-2,plants,home-garden	1	preview\\81\\annie-spratt-78044-unsplash__preview.jpg	\N		\N	t	t	72	1	40	40	\N
en	t	Black Eaves Chair	Black Eaves Chair	Comfortable to sit on thanks to the bowl-shaped seat and rounded shape of the backrest. No tools are required to assemble the chair, you just click it together with a simple mechanism under the seat.	black-eaves-chair	003.600.02	7000	7000	3,1	27,30,34	15,14,6,5	furniture-2,home-garden-2,furniture,home-garden	1	preview\\09\\andres-jasso-220776-unsplash__preview.jpg	\N		\N	t	t	83	1	51	51	\N
en	t	Balloon Chair	Balloon Chair	A charming vintage white wooden chair featuring an extremely spherical pink balloon. The balloon may be detached and used for other purposes, for example as a party decoration.	balloon-chair	34-BC82444	6500	6500	1	30,34	15,14,6,5	furniture-2,home-garden-2,furniture,home-garden	1	preview\\ef\\florian-klauer-14840-unsplash__preview.jpg	\N		\N	t	t	77	1	45	45	\N
en	t	Orchid	Orchid	Gloriously elegant. It can go along with any interior as it is a neutral color and the most popular Phalaenopsis overall. 2 to 3 foot stems host large white flowers that can last for over 2 months.	orchid	ROR00221	6500	6500	1	30,31	16,14,7,5	plants-2,home-garden-2,plants,home-garden	1	preview\\88\\zoltan-kovacs-642412-unsplash__preview.jpg	\N		\N	t	t	73	1	41	41	\N
en	t	Balloon Chair	Balloon Chair	A charming vintage white wooden chair featuring an extremely spherical pink balloon. The balloon may be detached and used for other purposes, for example as a party decoration.	balloon-chair	34-BC82444	6500	6500	1	30,34	15,14	furniture-2,home-garden-2	1	preview\\ef\\florian-klauer-14840-unsplash__preview.jpg	\N		\N	t	t	165	1	99	99	\N
en	t	Bedside Table	Bedside Table	Every table is unique, with varying grain pattern and natural colour shifts that are part of the charm of wood.	bedside-table	404.290.14	13000	13000	3,1	28,30,34	15,14,6,5	furniture-2,home-garden-2,furniture,home-garden	1	preview\\72\\benjamin-voros-310026-unsplash__preview.jpg	\N		\N	t	t	85	1	53	53	\N
en	t	Hand Trowel	Hand Trowel	Hand trowel for garden cultivating hammer finish epoxy-coated head for improved resistance to rust, scratches, humidity and alkalines in the soil.	hand-trowel	4058NB/09	499	499	1	30,31	16,14	plants-2,home-garden-2	1	preview\\7d\\neslihan-gunaydin-3493-unsplash__preview.jpg	\N		\N	t	t	164	1	98	98	\N
en	t	Grey Fabric Sofa	Grey Fabric Sofa	Seat cushions filled with high resilience foam and polyester fibre wadding give comfortable support for your body, and easily regain their shape when you get up. The cover is easy to keep clean as it is removable and can be machine washed.	grey-fabric-sofa	CH00001-12	29500	29500	3,1	35,30,34	15,14,6,5	furniture-2,home-garden-2,furniture,home-garden	1	preview\\69\\nathan-fertig-249917-unsplash__preview.jpg	\N		\N	t	t	78	1	46	46	\N
en	t	Aloe Vera	Aloe Vera	Decorative Aloe vera makes a lovely house plant. A really trendy plant, Aloe vera is just so easy to care for. Aloe vera sap has been renowned for its remarkable medicinal and cosmetic properties for many centuries and has been used to treat grazes, insect bites and sunburn - it really works.	aloe-vera	A44352	699	699	5,1	40,30,31	16,14	plants-2,home-garden-2	1	preview\\29\\silvia-agrasar-227575-unsplash__preview.jpg	\N		\N	t	t	158	1	92	92	\N
en	t	Wooden Stool	Wooden Stool	Solid wood is a hardwearing natural material, which can be sanded and surface treated as required.	wooden-stool	202.493.30	1400	1400	3,1	37,30,34	15,14	furniture-2,home-garden-2	1	preview\\d0\\ruslan-bardash-351288-unsplash__preview.jpg	\N		\N	t	t	172	1	106	106	\N
en	t	Comfy Padded Chair	Comfy Padded Chair	You sit comfortably thanks to the shaped back. The chair frame is made of solid wood, which is a durable natural material.	comfy-padded-chair	404.068.14	13000	13000	3,1	35,30,34	15,14	furniture-2,home-garden-2	1	preview\\3b\\kari-shea-398668-unsplash__preview.jpg	\N		\N	t	t	170	1	104	104	\N
en	t	Tulip Pot	Tulip Pot	Bright crimson red species tulip with black centers, the poppy-like flowers will open up in full sun. Ideal for rock gardens, pots and border edging.	tulip-pot	A58477	675	675	4,1	33,32,30,31	16,14,7,5	plants-2,home-garden-2,plants,home-garden	1	preview\\14\\natalia-y-345738-unsplash__preview.jpg	\N		\N	t	t	68	1	36	36	\N
en	t	Light Shade	Light Shade	Modern tapered white polycotton pendant shade with a metallic silver chrome interior finish for maximum light reflection. Reversible gimble so it can be used as a ceiling shade or as a lamp shade.	light-shade	B45809LSW	2845	2845	1	30,34	15,14,6,5	furniture-2,home-garden-2,furniture,home-garden	1	preview\\5f\\pierre-chatel-innocenti-483198-unsplash__preview.jpg	\N		\N	t	t	80	1	48	48	\N
en	t	Bonsai Tree	Bonsai Tree	Excellent semi-evergreen bonsai. Indoors or out but needs some winter protection. All trees sent will leave the nursery in excellent condition and will be of equal quality or better than the photograph shown.	bonsai-tree	B01MXFLUSV	1999	1999	1	30,31	16,14	plants-2,home-garden-2	1	preview\\f3\\mark-tegethoff-667351-unsplash__preview.jpg	\N		\N	t	t	162	1	96	96	\N
en	t	Spiky Cactus	Spiky Cactus	A spiky yet elegant house cactus - perfect for the home or office. Origin and habitat: Probably native only to the Andes of Peru	spiky-cactus	SC011001	1550	1550	5,1	40,30,31	16,14	plants-2,home-garden-2	1	preview\\78\\charles-deluvio-695736-unsplash__preview.jpg	\N		\N	t	t	155	1	89	89	\N
en	t	Tulip Pot	Tulip Pot	Bright crimson red species tulip with black centers, the poppy-like flowers will open up in full sun. Ideal for rock gardens, pots and border edging.	tulip-pot	A58477	675	675	5,1	41,40,30,31	16,14	plants-2,home-garden-2	1	preview\\14\\natalia-y-345738-unsplash__preview.jpg	\N		\N	t	t	156	1	90	90	\N
en	t	Spiky Cactus	Spiky Cactus	A spiky yet elegant house cactus - perfect for the home or office. Origin and habitat: Probably native only to the Andes of Peru	spiky-cactus	SC011001	1550	1550	4,1	32,30,31	16,14,7,5	plants-2,home-garden-2,plants,home-garden	1	preview\\78\\charles-deluvio-695736-unsplash__preview.jpg	\N		\N	t	t	67	1	35	35	\N
en	t	Hand Trowel	Hand Trowel	Hand trowel for garden cultivating hammer finish epoxy-coated head for improved resistance to rust, scratches, humidity and alkalines in the soil.	hand-trowel	4058NB/09	499	499	1	30,31	16,14,7,5	plants-2,home-garden-2,plants,home-garden	1	preview\\7d\\neslihan-gunaydin-3493-unsplash__preview.jpg	\N		\N	t	t	76	1	44	44	\N
en	t	Hanging Plant	Hanging Plant	Can be found in tropical and sub-tropical America where it grows on the branches of trees, but also on telephone wires and electricity cables and poles that sometimes topple with the weight of these plants. This plant loves a moist and warm air.	hanging-plant	A44223	1995	1995	4,1	33,30,31	16,14,7,5	plants-2,home-garden-2,plants,home-garden	1	preview\\5b\\alex-rodriguez-santibanez-200278-unsplash__preview.jpg	\N		\N	t	t	69	1	37	37	\N
en	t	Wooden Side Desk	Wooden Side Desk	Drawer stops prevent the drawers from being pulled out too far. Built-in cable management for collecting cables and cords; out of sight but close at hand.	wooden-side-desk	304.096.29	12500	12500	3,1	37,30,34	15,14,6,5	furniture-2,home-garden-2,furniture,home-garden	1	preview\\40\\abel-y-costa-716024-unsplash__preview.jpg	\N		\N	t	t	81	1	49	49	\N
en	t	Leather Sofa	Leather Sofa	This premium, tan-brown bonded leather seat is part of the 'chill' sofa range. The lever activated recline feature makes it easy to adjust to any position. This smart, bustle back design with rounded tight padded arms has been designed with your comfort in mind. This well-padded chair has foam pocket sprung seat cushions and fibre-filled back cushions.	leather-sofa	CH00001-02	124500	124500	3,1	36,30,34	15,14,6,5	furniture-2,home-garden-2,furniture,home-garden	1	preview\\3e\\paul-weaver-1120584-unsplash__preview.jpg	\N		\N	t	t	79	1	47	47	\N
en	t	Wooden Stool	Wooden Stool	Solid wood is a hardwearing natural material, which can be sanded and surface treated as required.	wooden-stool	202.493.30	1400	1400	3,1	37,30,34	15,14,6,5	furniture-2,home-garden-2,furniture,home-garden	1	preview\\d0\\ruslan-bardash-351288-unsplash__preview.jpg	\N		\N	t	t	84	1	52	52	\N
en	t	Bonsai Tree	Bonsai Tree	Excellent semi-evergreen bonsai. Indoors or out but needs some winter protection. All trees sent will leave the nursery in excellent condition and will be of equal quality or better than the photograph shown.	bonsai-tree	B01MXFLUSV	1999	1999	1	30,31	16,14,7,5	plants-2,home-garden-2,plants,home-garden	1	preview\\f3\\mark-tegethoff-667351-unsplash__preview.jpg	\N		\N	t	t	74	1	42	42	\N
en	t	Fern Blechnum Gibbum	Fern Blechnum Gibbum	Create a tropical feel in your home with this lush green tree fern, it has decorative leaves and will develop a short slender trunk in time.	fern-blechnum-gibbum	A04851	895	895	5,1	41,30,31	16,14	plants-2,home-garden-2	1	preview\\6d\\caleb-george-536388-unsplash__preview.jpg	\N		\N	t	t	159	1	93	93	\N
en	t	Black Eaves Chair	Black Eaves Chair	Comfortable to sit on thanks to the bowl-shaped seat and rounded shape of the backrest. No tools are required to assemble the chair, you just click it together with a simple mechanism under the seat.	black-eaves-chair	003.600.02	7000	7000	3,1	27,30,34	15,14	furniture-2,home-garden-2	1	preview\\09\\andres-jasso-220776-unsplash__preview.jpg	\N		\N	t	t	171	1	105	105	\N
en	t	Aloe Vera	Aloe Vera	Decorative Aloe vera makes a lovely house plant. A really trendy plant, Aloe vera is just so easy to care for. Aloe vera sap has been renowned for its remarkable medicinal and cosmetic properties for many centuries and has been used to treat grazes, insect bites and sunburn - it really works.	aloe-vera	A44352	699	699	4,1	32,30,31	16,14,7,5	plants-2,home-garden-2,plants,home-garden	1	preview\\29\\silvia-agrasar-227575-unsplash__preview.jpg	\N		\N	t	t	70	1	38	38	\N
en	t	Guardian Lion Statue	Guardian Lion Statue	Placing it at home or office can bring you fortune and prosperity, guard your house and ward off ill fortune.	guardian-lion-statue	GL34LLW11	18853	18853	3,1	35,30,34	15,14,6,5	furniture-2,home-garden-2,furniture,home-garden	1	preview\\44\\vincent-liu-525429-unsplash__preview.jpg	\N		\N	t	t	75	1	43	43	\N
en	t	Grey Fabric Sofa	Grey Fabric Sofa	Seat cushions filled with high resilience foam and polyester fibre wadding give comfortable support for your body, and easily regain their shape when you get up. The cover is easy to keep clean as it is removable and can be machine washed.	grey-fabric-sofa	CH00001-12	29500	29500	3,1	35,30,34	15,14	furniture-2,home-garden-2	1	preview\\69\\nathan-fertig-249917-unsplash__preview.jpg	\N		\N	t	t	166	1	100	100	\N
en	t	Wooden Side Desk	Wooden Side Desk	Drawer stops prevent the drawers from being pulled out too far. Built-in cable management for collecting cables and cords; out of sight but close at hand.	wooden-side-desk	304.096.29	12500	12500	3,1	37,30,34	15,14	furniture-2,home-garden-2	1	preview\\40\\abel-y-costa-716024-unsplash__preview.jpg	\N		\N	t	t	169	1	103	103	\N
en	t	Orchid	Orchid	Gloriously elegant. It can go along with any interior as it is a neutral color and the most popular Phalaenopsis overall. 2 to 3 foot stems host large white flowers that can last for over 2 months.	orchid	ROR00221	6500	6500	1	30,31	16,14	plants-2,home-garden-2	1	preview\\88\\zoltan-kovacs-642412-unsplash__preview.jpg	\N		\N	t	t	161	1	95	95	\N
en	t	Hanging Plant	Hanging Plant	Can be found in tropical and sub-tropical America where it grows on the branches of trees, but also on telephone wires and electricity cables and poles that sometimes topple with the weight of these plants. This plant loves a moist and warm air.	hanging-plant	A44223	1995	1995	5,1	41,30,31	16,14	plants-2,home-garden-2	1	preview\\5b\\alex-rodriguez-santibanez-200278-unsplash__preview.jpg	\N		\N	t	t	157	1	91	91	\N
en	t	Bedside Table	Bedside Table	Every table is unique, with varying grain pattern and natural colour shifts that are part of the charm of wood.	bedside-table	404.290.14	13000	13000	3,1	28,30,34	15,14	furniture-2,home-garden-2	1	preview\\72\\benjamin-voros-310026-unsplash__preview.jpg	\N		\N	t	t	173	1	107	107	\N
\.


--
-- Data for Name: session; Type: TABLE DATA; Schema: public; Owner: ghienan
--

COPY public.session ("createdAt", "updatedAt", token, expires, invalidated, "authenticationStrategy", id, "activeOrderId", "activeChannelId", type, "userId") FROM stdin;
2021-10-15 15:16:33.270361	2021-10-15 15:16:33.292199	8b437a41e579b0c673006522e1b4be6c11bd9661c0cd9926c8d9bb36194b683e	2022-10-15 21:16:33.269	f	\N	1	\N	1	AnonymousSession	\N
2021-10-15 15:16:41.523081	2021-10-15 15:16:41.855252	2890b355291e62168a7fcaa105c8fd3b12afec9a0b78bdb508570df2ff83f819	2022-10-15 21:16:41.82	f	native	2	\N	1	AuthenticatedSession	1
\.


--
-- Data for Name: shipping_line; Type: TABLE DATA; Schema: public; Owner: ghienan
--

COPY public.shipping_line ("createdAt", "updatedAt", "listPrice", "listPriceIncludesTax", adjustments, "taxLines", id, "shippingMethodId", "orderId") FROM stdin;
\.


--
-- Data for Name: shipping_method; Type: TABLE DATA; Schema: public; Owner: ghienan
--

COPY public.shipping_method ("createdAt", "updatedAt", "deletedAt", code, checker, calculator, "fulfillmentHandlerCode", id) FROM stdin;
2021-10-15 15:12:30.921046	2021-10-15 15:12:30.921046	\N	standard-shipping	{"code":"default-shipping-eligibility-checker","args":[{"name":"orderMinimum","value":"0"}]}	{"code":"default-shipping-calculator","args":[{"name":"rate","value":"500"},{"name":"taxRate","value":"0"},{"name":"includesTax","value":"auto"}]}	manual-fulfillment	1
2021-10-15 15:12:30.93888	2021-10-15 15:12:30.93888	\N	express-shipping	{"code":"default-shipping-eligibility-checker","args":[{"name":"orderMinimum","value":"0"}]}	{"code":"default-shipping-calculator","args":[{"name":"rate","value":"1000"},{"name":"taxRate","value":"0"},{"name":"includesTax","value":"auto"}]}	manual-fulfillment	2
2021-11-08 13:37:34.643875	2021-11-08 13:37:34.643875	\N	standard-shipping	{"code":"default-shipping-eligibility-checker","args":[{"name":"orderMinimum","value":"0"}]}	{"code":"default-shipping-calculator","args":[{"name":"rate","value":"500"},{"name":"taxRate","value":"0"},{"name":"includesTax","value":"auto"}]}	manual-fulfillment	3
2021-11-08 13:37:34.66622	2021-11-08 13:37:34.66622	\N	express-shipping	{"code":"default-shipping-eligibility-checker","args":[{"name":"orderMinimum","value":"0"}]}	{"code":"default-shipping-calculator","args":[{"name":"rate","value":"1000"},{"name":"taxRate","value":"0"},{"name":"includesTax","value":"auto"}]}	manual-fulfillment	4
\.


--
-- Data for Name: shipping_method_channels_channel; Type: TABLE DATA; Schema: public; Owner: ghienan
--

COPY public.shipping_method_channels_channel ("shippingMethodId", "channelId") FROM stdin;
1	1
2	1
3	1
4	1
\.


--
-- Data for Name: shipping_method_translation; Type: TABLE DATA; Schema: public; Owner: ghienan
--

COPY public.shipping_method_translation ("createdAt", "updatedAt", "languageCode", name, description, id, "baseId") FROM stdin;
2021-10-15 15:12:30.917862	2021-10-15 15:12:30.921046	en	Standard Shipping		1	1
2021-10-15 15:12:30.937593	2021-10-15 15:12:30.93888	en	Express Shipping		2	2
2021-11-08 13:37:34.639948	2021-11-08 13:37:34.643875	en	Standard Shipping		3	3
2021-11-08 13:37:34.664888	2021-11-08 13:37:34.66622	en	Express Shipping		4	4
\.


--
-- Data for Name: stock_movement; Type: TABLE DATA; Schema: public; Owner: ghienan
--

COPY public.stock_movement ("createdAt", "updatedAt", type, quantity, id, discriminator, "productVariantId", "orderItemId", "orderLineId") FROM stdin;
2021-10-15 15:12:31.161466	2021-10-15 15:12:31.161466	ADJUSTMENT	100	1	StockAdjustment	1	\N	\N
2021-10-15 15:12:31.171664	2021-10-15 15:12:31.171664	ADJUSTMENT	100	2	StockAdjustment	2	\N	\N
2021-10-15 15:12:31.180745	2021-10-15 15:12:31.180745	ADJUSTMENT	100	3	StockAdjustment	3	\N	\N
2021-10-15 15:12:31.187376	2021-10-15 15:12:31.187376	ADJUSTMENT	100	4	StockAdjustment	4	\N	\N
2021-10-15 15:12:31.216498	2021-10-15 15:12:31.216498	ADJUSTMENT	100	5	StockAdjustment	5	\N	\N
2021-10-15 15:12:31.225006	2021-10-15 15:12:31.225006	ADJUSTMENT	100	6	StockAdjustment	6	\N	\N
2021-10-15 15:12:31.248705	2021-10-15 15:12:31.248705	ADJUSTMENT	100	7	StockAdjustment	7	\N	\N
2021-10-15 15:12:31.272017	2021-10-15 15:12:31.272017	ADJUSTMENT	100	8	StockAdjustment	8	\N	\N
2021-10-15 15:12:31.302891	2021-10-15 15:12:31.302891	ADJUSTMENT	100	9	StockAdjustment	9	\N	\N
2021-10-15 15:12:31.3088	2021-10-15 15:12:31.3088	ADJUSTMENT	100	10	StockAdjustment	10	\N	\N
2021-10-15 15:12:31.343858	2021-10-15 15:12:31.343858	ADJUSTMENT	100	11	StockAdjustment	11	\N	\N
2021-10-15 15:12:31.350454	2021-10-15 15:12:31.350454	ADJUSTMENT	100	12	StockAdjustment	12	\N	\N
2021-10-15 15:12:31.357404	2021-10-15 15:12:31.357404	ADJUSTMENT	100	13	StockAdjustment	13	\N	\N
2021-10-15 15:12:31.404482	2021-10-15 15:12:31.404482	ADJUSTMENT	100	14	StockAdjustment	14	\N	\N
2021-10-15 15:12:31.410065	2021-10-15 15:12:31.410065	ADJUSTMENT	100	15	StockAdjustment	15	\N	\N
2021-10-15 15:12:31.417335	2021-10-15 15:12:31.417335	ADJUSTMENT	100	16	StockAdjustment	16	\N	\N
2021-10-15 15:12:31.425882	2021-10-15 15:12:31.425882	ADJUSTMENT	100	17	StockAdjustment	17	\N	\N
2021-10-15 15:12:31.467115	2021-10-15 15:12:31.467115	ADJUSTMENT	100	18	StockAdjustment	18	\N	\N
2021-10-15 15:12:31.472443	2021-10-15 15:12:31.472443	ADJUSTMENT	100	19	StockAdjustment	19	\N	\N
2021-10-15 15:12:31.478552	2021-10-15 15:12:31.478552	ADJUSTMENT	100	20	StockAdjustment	20	\N	\N
2021-10-15 15:12:31.487338	2021-10-15 15:12:31.487338	ADJUSTMENT	100	21	StockAdjustment	21	\N	\N
2021-10-15 15:12:31.494086	2021-10-15 15:12:31.494086	ADJUSTMENT	100	22	StockAdjustment	22	\N	\N
2021-10-15 15:12:31.509848	2021-10-15 15:12:31.509848	ADJUSTMENT	100	23	StockAdjustment	23	\N	\N
2021-10-15 15:12:31.525811	2021-10-15 15:12:31.525811	ADJUSTMENT	100	24	StockAdjustment	24	\N	\N
2021-10-15 15:12:31.542678	2021-10-15 15:12:31.542678	ADJUSTMENT	100	25	StockAdjustment	25	\N	\N
2021-10-15 15:12:31.569286	2021-10-15 15:12:31.569286	ADJUSTMENT	100	26	StockAdjustment	26	\N	\N
2021-10-15 15:12:31.593699	2021-10-15 15:12:31.593699	ADJUSTMENT	100	27	StockAdjustment	27	\N	\N
2021-10-15 15:12:31.613512	2021-10-15 15:12:31.613512	ADJUSTMENT	100	28	StockAdjustment	28	\N	\N
2021-10-15 15:12:31.634802	2021-10-15 15:12:31.634802	ADJUSTMENT	100	29	StockAdjustment	29	\N	\N
2021-10-15 15:12:31.656043	2021-10-15 15:12:31.656043	ADJUSTMENT	100	30	StockAdjustment	30	\N	\N
2021-10-15 15:12:31.677652	2021-10-15 15:12:31.677652	ADJUSTMENT	100	31	StockAdjustment	31	\N	\N
2021-10-15 15:12:31.695691	2021-10-15 15:12:31.695691	ADJUSTMENT	100	32	StockAdjustment	32	\N	\N
2021-10-15 15:12:31.713144	2021-10-15 15:12:31.713144	ADJUSTMENT	100	33	StockAdjustment	33	\N	\N
2021-10-15 15:12:31.73252	2021-10-15 15:12:31.73252	ADJUSTMENT	100	34	StockAdjustment	34	\N	\N
2021-10-15 15:12:31.76586	2021-10-15 15:12:31.76586	ADJUSTMENT	100	35	StockAdjustment	35	\N	\N
2021-10-15 15:12:31.787807	2021-10-15 15:12:31.787807	ADJUSTMENT	100	36	StockAdjustment	36	\N	\N
2021-10-15 15:12:31.804854	2021-10-15 15:12:31.804854	ADJUSTMENT	100	37	StockAdjustment	37	\N	\N
2021-10-15 15:12:31.822118	2021-10-15 15:12:31.822118	ADJUSTMENT	100	38	StockAdjustment	38	\N	\N
2021-10-15 15:12:31.853816	2021-10-15 15:12:31.853816	ADJUSTMENT	100	39	StockAdjustment	39	\N	\N
2021-10-15 15:12:31.880998	2021-10-15 15:12:31.880998	ADJUSTMENT	100	40	StockAdjustment	40	\N	\N
2021-10-15 15:12:31.904375	2021-10-15 15:12:31.904375	ADJUSTMENT	100	41	StockAdjustment	41	\N	\N
2021-10-15 15:12:31.92056	2021-10-15 15:12:31.92056	ADJUSTMENT	100	42	StockAdjustment	42	\N	\N
2021-10-15 15:12:31.99091	2021-10-15 15:12:31.99091	ADJUSTMENT	100	43	StockAdjustment	43	\N	\N
2021-10-15 15:12:31.996886	2021-10-15 15:12:31.996886	ADJUSTMENT	100	44	StockAdjustment	44	\N	\N
2021-10-15 15:12:32.003258	2021-10-15 15:12:32.003258	ADJUSTMENT	100	45	StockAdjustment	45	\N	\N
2021-10-15 15:12:32.01011	2021-10-15 15:12:32.01011	ADJUSTMENT	100	46	StockAdjustment	46	\N	\N
2021-10-15 15:12:32.048261	2021-10-15 15:12:32.048261	ADJUSTMENT	100	47	StockAdjustment	47	\N	\N
2021-10-15 15:12:32.054289	2021-10-15 15:12:32.054289	ADJUSTMENT	100	48	StockAdjustment	48	\N	\N
2021-10-15 15:12:32.059444	2021-10-15 15:12:32.059444	ADJUSTMENT	100	49	StockAdjustment	49	\N	\N
2021-10-15 15:12:32.06671	2021-10-15 15:12:32.06671	ADJUSTMENT	100	50	StockAdjustment	50	\N	\N
2021-10-15 15:12:32.107448	2021-10-15 15:12:32.107448	ADJUSTMENT	100	51	StockAdjustment	51	\N	\N
2021-10-15 15:12:32.113797	2021-10-15 15:12:32.113797	ADJUSTMENT	100	52	StockAdjustment	52	\N	\N
2021-10-15 15:12:32.121136	2021-10-15 15:12:32.121136	ADJUSTMENT	100	53	StockAdjustment	53	\N	\N
2021-10-15 15:12:32.127384	2021-10-15 15:12:32.127384	ADJUSTMENT	100	54	StockAdjustment	54	\N	\N
2021-10-15 15:12:32.156925	2021-10-15 15:12:32.156925	ADJUSTMENT	100	55	StockAdjustment	55	\N	\N
2021-10-15 15:12:32.164009	2021-10-15 15:12:32.164009	ADJUSTMENT	100	56	StockAdjustment	56	\N	\N
2021-10-15 15:12:32.171154	2021-10-15 15:12:32.171154	ADJUSTMENT	100	57	StockAdjustment	57	\N	\N
2021-10-15 15:12:32.176988	2021-10-15 15:12:32.176988	ADJUSTMENT	100	58	StockAdjustment	58	\N	\N
2021-10-15 15:12:32.207532	2021-10-15 15:12:32.207532	ADJUSTMENT	100	59	StockAdjustment	59	\N	\N
2021-10-15 15:12:32.212514	2021-10-15 15:12:32.212514	ADJUSTMENT	100	60	StockAdjustment	60	\N	\N
2021-10-15 15:12:32.218251	2021-10-15 15:12:32.218251	ADJUSTMENT	100	61	StockAdjustment	61	\N	\N
2021-10-15 15:12:32.223298	2021-10-15 15:12:32.223298	ADJUSTMENT	100	62	StockAdjustment	62	\N	\N
2021-10-15 15:12:32.293832	2021-10-15 15:12:32.293832	ADJUSTMENT	100	63	StockAdjustment	63	\N	\N
2021-10-15 15:12:32.302695	2021-10-15 15:12:32.302695	ADJUSTMENT	100	64	StockAdjustment	64	\N	\N
2021-10-15 15:12:32.309102	2021-10-15 15:12:32.309102	ADJUSTMENT	100	65	StockAdjustment	65	\N	\N
2021-10-15 15:12:32.317446	2021-10-15 15:12:32.317446	ADJUSTMENT	100	66	StockAdjustment	66	\N	\N
2021-10-15 15:12:32.365005	2021-10-15 15:12:32.365005	ADJUSTMENT	100	67	StockAdjustment	67	\N	\N
2021-10-15 15:12:32.386589	2021-10-15 15:12:32.386589	ADJUSTMENT	100	68	StockAdjustment	68	\N	\N
2021-10-15 15:12:32.404292	2021-10-15 15:12:32.404292	ADJUSTMENT	100	69	StockAdjustment	69	\N	\N
2021-10-15 15:12:32.420409	2021-10-15 15:12:32.420409	ADJUSTMENT	100	70	StockAdjustment	70	\N	\N
2021-10-15 15:12:32.437084	2021-10-15 15:12:32.437084	ADJUSTMENT	100	71	StockAdjustment	71	\N	\N
2021-10-15 15:12:32.453656	2021-10-15 15:12:32.453656	ADJUSTMENT	100	72	StockAdjustment	72	\N	\N
2021-10-15 15:12:32.468418	2021-10-15 15:12:32.468418	ADJUSTMENT	100	73	StockAdjustment	73	\N	\N
2021-10-15 15:12:32.483975	2021-10-15 15:12:32.483975	ADJUSTMENT	100	74	StockAdjustment	74	\N	\N
2021-10-15 15:12:32.512146	2021-10-15 15:12:32.512146	ADJUSTMENT	100	75	StockAdjustment	75	\N	\N
2021-10-15 15:12:32.548598	2021-10-15 15:12:32.548598	ADJUSTMENT	100	76	StockAdjustment	76	\N	\N
2021-10-15 15:12:32.596836	2021-10-15 15:12:32.596836	ADJUSTMENT	100	77	StockAdjustment	77	\N	\N
2021-10-15 15:12:32.613749	2021-10-15 15:12:32.613749	ADJUSTMENT	100	78	StockAdjustment	78	\N	\N
2021-10-15 15:12:32.637303	2021-10-15 15:12:32.637303	ADJUSTMENT	100	79	StockAdjustment	79	\N	\N
2021-10-15 15:12:32.654414	2021-10-15 15:12:32.654414	ADJUSTMENT	100	80	StockAdjustment	80	\N	\N
2021-10-15 15:12:32.678851	2021-10-15 15:12:32.678851	ADJUSTMENT	100	81	StockAdjustment	81	\N	\N
2021-10-15 15:12:32.698262	2021-10-15 15:12:32.698262	ADJUSTMENT	100	82	StockAdjustment	82	\N	\N
2021-10-15 15:12:32.717229	2021-10-15 15:12:32.717229	ADJUSTMENT	100	83	StockAdjustment	83	\N	\N
2021-10-15 15:12:32.733458	2021-10-15 15:12:32.733458	ADJUSTMENT	100	84	StockAdjustment	84	\N	\N
2021-10-15 15:12:32.752051	2021-10-15 15:12:32.752051	ADJUSTMENT	100	85	StockAdjustment	85	\N	\N
2021-10-15 15:12:32.789294	2021-10-15 15:12:32.789294	ADJUSTMENT	100	86	StockAdjustment	86	\N	\N
2021-10-15 15:12:32.801869	2021-10-15 15:12:32.801869	ADJUSTMENT	100	87	StockAdjustment	87	\N	\N
2021-10-15 15:12:32.808542	2021-10-15 15:12:32.808542	ADJUSTMENT	100	88	StockAdjustment	88	\N	\N
2021-11-08 13:37:34.930094	2021-11-08 13:37:34.930094	ADJUSTMENT	100	89	StockAdjustment	89	\N	\N
2021-11-08 13:37:34.949378	2021-11-08 13:37:34.949378	ADJUSTMENT	100	90	StockAdjustment	90	\N	\N
2021-11-08 13:37:34.958066	2021-11-08 13:37:34.958066	ADJUSTMENT	100	91	StockAdjustment	91	\N	\N
2021-11-08 13:37:34.965034	2021-11-08 13:37:34.965034	ADJUSTMENT	100	92	StockAdjustment	92	\N	\N
2021-11-08 13:37:34.999802	2021-11-08 13:37:34.999802	ADJUSTMENT	100	93	StockAdjustment	93	\N	\N
2021-11-08 13:37:35.008133	2021-11-08 13:37:35.008133	ADJUSTMENT	100	94	StockAdjustment	94	\N	\N
2021-11-08 13:37:35.029878	2021-11-08 13:37:35.029878	ADJUSTMENT	100	95	StockAdjustment	95	\N	\N
2021-11-08 13:37:35.05072	2021-11-08 13:37:35.05072	ADJUSTMENT	100	96	StockAdjustment	96	\N	\N
2021-11-08 13:37:35.088242	2021-11-08 13:37:35.088242	ADJUSTMENT	100	97	StockAdjustment	97	\N	\N
2021-11-08 13:37:35.098414	2021-11-08 13:37:35.098414	ADJUSTMENT	100	98	StockAdjustment	98	\N	\N
2021-11-08 13:37:35.135402	2021-11-08 13:37:35.135402	ADJUSTMENT	100	99	StockAdjustment	99	\N	\N
2021-11-08 13:37:35.142955	2021-11-08 13:37:35.142955	ADJUSTMENT	100	100	StockAdjustment	100	\N	\N
2021-11-08 13:37:35.149195	2021-11-08 13:37:35.149195	ADJUSTMENT	100	101	StockAdjustment	101	\N	\N
2021-11-08 13:37:35.197911	2021-11-08 13:37:35.197911	ADJUSTMENT	100	102	StockAdjustment	102	\N	\N
2021-11-08 13:37:35.207611	2021-11-08 13:37:35.207611	ADJUSTMENT	100	103	StockAdjustment	103	\N	\N
2021-11-08 13:37:35.216084	2021-11-08 13:37:35.216084	ADJUSTMENT	100	104	StockAdjustment	104	\N	\N
2021-11-08 13:37:35.224166	2021-11-08 13:37:35.224166	ADJUSTMENT	100	105	StockAdjustment	105	\N	\N
2021-11-08 13:37:35.273109	2021-11-08 13:37:35.273109	ADJUSTMENT	100	106	StockAdjustment	106	\N	\N
2021-11-08 13:37:35.278783	2021-11-08 13:37:35.278783	ADJUSTMENT	100	107	StockAdjustment	107	\N	\N
2021-11-08 13:37:35.285355	2021-11-08 13:37:35.285355	ADJUSTMENT	100	108	StockAdjustment	108	\N	\N
2021-11-08 13:37:35.292394	2021-11-08 13:37:35.292394	ADJUSTMENT	100	109	StockAdjustment	109	\N	\N
2021-11-08 13:37:35.298433	2021-11-08 13:37:35.298433	ADJUSTMENT	100	110	StockAdjustment	110	\N	\N
2021-11-08 13:37:35.317917	2021-11-08 13:37:35.317917	ADJUSTMENT	100	111	StockAdjustment	111	\N	\N
2021-11-08 13:37:35.338314	2021-11-08 13:37:35.338314	ADJUSTMENT	100	112	StockAdjustment	112	\N	\N
2021-11-08 13:37:35.357096	2021-11-08 13:37:35.357096	ADJUSTMENT	100	113	StockAdjustment	113	\N	\N
2021-11-08 13:37:35.376413	2021-11-08 13:37:35.376413	ADJUSTMENT	100	114	StockAdjustment	114	\N	\N
2021-11-08 13:37:35.396308	2021-11-08 13:37:35.396308	ADJUSTMENT	100	115	StockAdjustment	115	\N	\N
2021-11-08 13:37:35.414793	2021-11-08 13:37:35.414793	ADJUSTMENT	100	116	StockAdjustment	116	\N	\N
2021-11-08 13:37:35.431157	2021-11-08 13:37:35.431157	ADJUSTMENT	100	117	StockAdjustment	117	\N	\N
2021-11-08 13:37:35.451589	2021-11-08 13:37:35.451589	ADJUSTMENT	100	118	StockAdjustment	118	\N	\N
2021-11-08 13:37:35.476285	2021-11-08 13:37:35.476285	ADJUSTMENT	100	119	StockAdjustment	119	\N	\N
2021-11-08 13:37:35.494564	2021-11-08 13:37:35.494564	ADJUSTMENT	100	120	StockAdjustment	120	\N	\N
2021-11-08 13:37:35.512252	2021-11-08 13:37:35.512252	ADJUSTMENT	100	121	StockAdjustment	121	\N	\N
2021-11-08 13:37:35.5299	2021-11-08 13:37:35.5299	ADJUSTMENT	100	122	StockAdjustment	122	\N	\N
2021-11-08 13:37:35.549557	2021-11-08 13:37:35.549557	ADJUSTMENT	100	123	StockAdjustment	123	\N	\N
2021-11-08 13:37:35.565223	2021-11-08 13:37:35.565223	ADJUSTMENT	100	124	StockAdjustment	124	\N	\N
2021-11-08 13:37:35.581176	2021-11-08 13:37:35.581176	ADJUSTMENT	100	125	StockAdjustment	125	\N	\N
2021-11-08 13:37:35.601672	2021-11-08 13:37:35.601672	ADJUSTMENT	100	126	StockAdjustment	126	\N	\N
2021-11-08 13:37:35.618813	2021-11-08 13:37:35.618813	ADJUSTMENT	100	127	StockAdjustment	127	\N	\N
2021-11-08 13:37:35.634389	2021-11-08 13:37:35.634389	ADJUSTMENT	100	128	StockAdjustment	128	\N	\N
2021-11-08 13:37:35.648654	2021-11-08 13:37:35.648654	ADJUSTMENT	100	129	StockAdjustment	129	\N	\N
2021-11-08 13:37:35.6634	2021-11-08 13:37:35.6634	ADJUSTMENT	100	130	StockAdjustment	130	\N	\N
2021-11-08 13:37:35.703109	2021-11-08 13:37:35.703109	ADJUSTMENT	100	131	StockAdjustment	131	\N	\N
2021-11-08 13:37:35.709961	2021-11-08 13:37:35.709961	ADJUSTMENT	100	132	StockAdjustment	132	\N	\N
2021-11-08 13:37:35.716309	2021-11-08 13:37:35.716309	ADJUSTMENT	100	133	StockAdjustment	133	\N	\N
2021-11-08 13:37:35.722516	2021-11-08 13:37:35.722516	ADJUSTMENT	100	134	StockAdjustment	134	\N	\N
2021-11-08 13:37:35.755624	2021-11-08 13:37:35.755624	ADJUSTMENT	100	135	StockAdjustment	135	\N	\N
2021-11-08 13:37:35.761753	2021-11-08 13:37:35.761753	ADJUSTMENT	100	136	StockAdjustment	136	\N	\N
2021-11-08 13:37:35.771497	2021-11-08 13:37:35.771497	ADJUSTMENT	100	137	StockAdjustment	137	\N	\N
2021-11-08 13:37:35.78816	2021-11-08 13:37:35.78816	ADJUSTMENT	100	138	StockAdjustment	138	\N	\N
2021-11-08 13:37:35.845101	2021-11-08 13:37:35.845101	ADJUSTMENT	100	139	StockAdjustment	139	\N	\N
2021-11-08 13:37:35.853376	2021-11-08 13:37:35.853376	ADJUSTMENT	100	140	StockAdjustment	140	\N	\N
2021-11-08 13:37:35.860299	2021-11-08 13:37:35.860299	ADJUSTMENT	100	141	StockAdjustment	141	\N	\N
2021-11-08 13:37:35.866481	2021-11-08 13:37:35.866481	ADJUSTMENT	100	142	StockAdjustment	142	\N	\N
2021-11-08 13:37:35.905775	2021-11-08 13:37:35.905775	ADJUSTMENT	100	143	StockAdjustment	143	\N	\N
2021-11-08 13:37:35.911799	2021-11-08 13:37:35.911799	ADJUSTMENT	100	144	StockAdjustment	144	\N	\N
2021-11-08 13:37:35.919666	2021-11-08 13:37:35.919666	ADJUSTMENT	100	145	StockAdjustment	145	\N	\N
2021-11-08 13:37:35.92531	2021-11-08 13:37:35.92531	ADJUSTMENT	100	146	StockAdjustment	146	\N	\N
2021-11-08 13:37:35.957011	2021-11-08 13:37:35.957011	ADJUSTMENT	100	147	StockAdjustment	147	\N	\N
2021-11-08 13:37:35.962306	2021-11-08 13:37:35.962306	ADJUSTMENT	100	148	StockAdjustment	148	\N	\N
2021-11-08 13:37:35.968469	2021-11-08 13:37:35.968469	ADJUSTMENT	100	149	StockAdjustment	149	\N	\N
2021-11-08 13:37:35.976583	2021-11-08 13:37:35.976583	ADJUSTMENT	100	150	StockAdjustment	150	\N	\N
2021-11-08 13:37:36.011901	2021-11-08 13:37:36.011901	ADJUSTMENT	100	151	StockAdjustment	151	\N	\N
2021-11-08 13:37:36.017465	2021-11-08 13:37:36.017465	ADJUSTMENT	100	152	StockAdjustment	152	\N	\N
2021-11-08 13:37:36.026216	2021-11-08 13:37:36.026216	ADJUSTMENT	100	153	StockAdjustment	153	\N	\N
2021-11-08 13:37:36.031516	2021-11-08 13:37:36.031516	ADJUSTMENT	100	154	StockAdjustment	154	\N	\N
2021-11-08 13:37:36.085612	2021-11-08 13:37:36.085612	ADJUSTMENT	100	155	StockAdjustment	155	\N	\N
2021-11-08 13:37:36.108551	2021-11-08 13:37:36.108551	ADJUSTMENT	100	156	StockAdjustment	156	\N	\N
2021-11-08 13:37:36.127829	2021-11-08 13:37:36.127829	ADJUSTMENT	100	157	StockAdjustment	157	\N	\N
2021-11-08 13:37:36.145138	2021-11-08 13:37:36.145138	ADJUSTMENT	100	158	StockAdjustment	158	\N	\N
2021-11-08 13:37:36.162192	2021-11-08 13:37:36.162192	ADJUSTMENT	100	159	StockAdjustment	159	\N	\N
2021-11-08 13:37:36.181628	2021-11-08 13:37:36.181628	ADJUSTMENT	100	160	StockAdjustment	160	\N	\N
2021-11-08 13:37:36.201947	2021-11-08 13:37:36.201947	ADJUSTMENT	100	161	StockAdjustment	161	\N	\N
2021-11-08 13:37:36.216767	2021-11-08 13:37:36.216767	ADJUSTMENT	100	162	StockAdjustment	162	\N	\N
2021-11-08 13:37:36.242081	2021-11-08 13:37:36.242081	ADJUSTMENT	100	163	StockAdjustment	163	\N	\N
2021-11-08 13:37:36.263592	2021-11-08 13:37:36.263592	ADJUSTMENT	100	164	StockAdjustment	164	\N	\N
2021-11-08 13:37:36.282571	2021-11-08 13:37:36.282571	ADJUSTMENT	100	165	StockAdjustment	165	\N	\N
2021-11-08 13:37:36.298845	2021-11-08 13:37:36.298845	ADJUSTMENT	100	166	StockAdjustment	166	\N	\N
2021-11-08 13:37:36.316203	2021-11-08 13:37:36.316203	ADJUSTMENT	100	167	StockAdjustment	167	\N	\N
2021-11-08 13:37:36.331855	2021-11-08 13:37:36.331855	ADJUSTMENT	100	168	StockAdjustment	168	\N	\N
2021-11-08 13:37:36.348588	2021-11-08 13:37:36.348588	ADJUSTMENT	100	169	StockAdjustment	169	\N	\N
2021-11-08 13:37:36.364341	2021-11-08 13:37:36.364341	ADJUSTMENT	100	170	StockAdjustment	170	\N	\N
2021-11-08 13:37:36.382146	2021-11-08 13:37:36.382146	ADJUSTMENT	100	171	StockAdjustment	171	\N	\N
2021-11-08 13:37:36.396187	2021-11-08 13:37:36.396187	ADJUSTMENT	100	172	StockAdjustment	172	\N	\N
2021-11-08 13:37:36.41259	2021-11-08 13:37:36.41259	ADJUSTMENT	100	173	StockAdjustment	173	\N	\N
2021-11-08 13:37:36.446129	2021-11-08 13:37:36.446129	ADJUSTMENT	100	174	StockAdjustment	174	\N	\N
2021-11-08 13:37:36.452268	2021-11-08 13:37:36.452268	ADJUSTMENT	100	175	StockAdjustment	175	\N	\N
2021-11-08 13:37:36.460096	2021-11-08 13:37:36.460096	ADJUSTMENT	100	176	StockAdjustment	176	\N	\N
\.


--
-- Data for Name: surcharge; Type: TABLE DATA; Schema: public; Owner: ghienan
--

COPY public.surcharge ("createdAt", "updatedAt", description, "listPrice", "listPriceIncludesTax", sku, "taxLines", id, "orderId", "orderModificationId") FROM stdin;
\.


--
-- Data for Name: tag; Type: TABLE DATA; Schema: public; Owner: ghienan
--

COPY public.tag ("createdAt", "updatedAt", value, id) FROM stdin;
\.


--
-- Data for Name: tax_category; Type: TABLE DATA; Schema: public; Owner: ghienan
--

COPY public.tax_category ("createdAt", "updatedAt", name, "isDefault", id) FROM stdin;
2021-10-15 15:12:30.797792	2021-10-15 15:12:30.797792	Standard Tax	f	1
2021-10-15 15:12:30.839596	2021-10-15 15:12:30.839596	Reduced Tax	f	2
2021-10-15 15:12:30.881637	2021-10-15 15:12:30.881637	Zero Tax	f	3
2021-11-08 13:37:34.504251	2021-11-08 13:37:34.504251	Standard Tax	f	4
2021-11-08 13:37:34.554667	2021-11-08 13:37:34.554667	Reduced Tax	f	5
2021-11-08 13:37:34.601631	2021-11-08 13:37:34.601631	Zero Tax	f	6
\.


--
-- Data for Name: tax_rate; Type: TABLE DATA; Schema: public; Owner: ghienan
--

COPY public.tax_rate ("createdAt", "updatedAt", name, enabled, value, id, "categoryId", "zoneId", "customerGroupId") FROM stdin;
2021-10-15 15:12:30.803675	2021-10-15 15:12:30.803675	Standard Tax Asia	t	20.00	1	1	1	\N
2021-10-15 15:12:30.816707	2021-10-15 15:12:30.816707	Standard Tax Europe	t	20.00	2	1	2	\N
2021-10-15 15:12:30.82238	2021-10-15 15:12:30.82238	Standard Tax Africa	t	20.00	3	1	3	\N
2021-10-15 15:12:30.827978	2021-10-15 15:12:30.827978	Standard Tax Oceania	t	20.00	4	1	4	\N
2021-10-15 15:12:30.834223	2021-10-15 15:12:30.834223	Standard Tax Americas	t	20.00	5	1	5	\N
2021-10-15 15:12:30.842766	2021-10-15 15:12:30.842766	Reduced Tax Asia	t	10.00	6	2	1	\N
2021-10-15 15:12:30.853161	2021-10-15 15:12:30.853161	Reduced Tax Europe	t	10.00	7	2	2	\N
2021-10-15 15:12:30.860851	2021-10-15 15:12:30.860851	Reduced Tax Africa	t	10.00	8	2	3	\N
2021-10-15 15:12:30.868108	2021-10-15 15:12:30.868108	Reduced Tax Oceania	t	10.00	9	2	4	\N
2021-10-15 15:12:30.875447	2021-10-15 15:12:30.875447	Reduced Tax Americas	t	10.00	10	2	5	\N
2021-10-15 15:12:30.884728	2021-10-15 15:12:30.884728	Zero Tax Asia	t	0.00	11	3	1	\N
2021-10-15 15:12:30.890504	2021-10-15 15:12:30.890504	Zero Tax Europe	t	0.00	12	3	2	\N
2021-10-15 15:12:30.897084	2021-10-15 15:12:30.897084	Zero Tax Africa	t	0.00	13	3	3	\N
2021-10-15 15:12:30.904296	2021-10-15 15:12:30.904296	Zero Tax Oceania	t	0.00	14	3	4	\N
2021-10-15 15:12:30.910414	2021-10-15 15:12:30.910414	Zero Tax Americas	t	0.00	15	3	5	\N
2021-11-08 13:37:34.512117	2021-11-08 13:37:34.512117	Standard Tax Asia	t	20.00	16	4	6	\N
2021-11-08 13:37:34.528371	2021-11-08 13:37:34.528371	Standard Tax Europe	t	20.00	17	4	7	\N
2021-11-08 13:37:34.535343	2021-11-08 13:37:34.535343	Standard Tax Africa	t	20.00	18	4	8	\N
2021-11-08 13:37:34.541871	2021-11-08 13:37:34.541871	Standard Tax Oceania	t	20.00	19	4	9	\N
2021-11-08 13:37:34.548942	2021-11-08 13:37:34.548942	Standard Tax Americas	t	20.00	20	4	10	\N
2021-11-08 13:37:34.557101	2021-11-08 13:37:34.557101	Reduced Tax Asia	t	10.00	21	5	6	\N
2021-11-08 13:37:34.563155	2021-11-08 13:37:34.563155	Reduced Tax Europe	t	10.00	22	5	7	\N
2021-11-08 13:37:34.573675	2021-11-08 13:37:34.573675	Reduced Tax Africa	t	10.00	23	5	8	\N
2021-11-08 13:37:34.582259	2021-11-08 13:37:34.582259	Reduced Tax Oceania	t	10.00	24	5	9	\N
2021-11-08 13:37:34.595118	2021-11-08 13:37:34.595118	Reduced Tax Americas	t	10.00	25	5	10	\N
2021-11-08 13:37:34.60438	2021-11-08 13:37:34.60438	Zero Tax Asia	t	0.00	26	6	6	\N
2021-11-08 13:37:34.610614	2021-11-08 13:37:34.610614	Zero Tax Europe	t	0.00	27	6	7	\N
2021-11-08 13:37:34.617067	2021-11-08 13:37:34.617067	Zero Tax Africa	t	0.00	28	6	8	\N
2021-11-08 13:37:34.626088	2021-11-08 13:37:34.626088	Zero Tax Oceania	t	0.00	29	6	9	\N
2021-11-08 13:37:34.633361	2021-11-08 13:37:34.633361	Zero Tax Americas	t	0.00	30	6	10	\N
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: ghienan
--

COPY public."user" ("createdAt", "updatedAt", "deletedAt", identifier, verified, "lastLogin", id) FROM stdin;
2021-10-15 15:12:29.432087	2021-10-15 15:16:41.523081	\N	admin	t	2021-10-15 15:16:41.806	1
\.


--
-- Data for Name: user_roles_role; Type: TABLE DATA; Schema: public; Owner: ghienan
--

COPY public.user_roles_role ("userId", "roleId") FROM stdin;
1	1
\.


--
-- Data for Name: zone; Type: TABLE DATA; Schema: public; Owner: ghienan
--

COPY public.zone ("createdAt", "updatedAt", name, id) FROM stdin;
2021-10-15 15:12:29.613742	2021-10-15 15:12:29.613742	Asia	1
2021-10-15 15:12:29.625916	2021-10-15 15:12:29.625916	Europe	2
2021-10-15 15:12:29.642777	2021-10-15 15:12:29.642777	Africa	3
2021-10-15 15:12:29.652585	2021-10-15 15:12:29.652585	Oceania	4
2021-10-15 15:12:29.676729	2021-10-15 15:12:29.676729	Americas	5
2021-11-08 13:37:33.114896	2021-11-08 13:37:33.114896	Asia	6
2021-11-08 13:37:33.149538	2021-11-08 13:37:33.149538	Europe	7
2021-11-08 13:37:33.178873	2021-11-08 13:37:33.178873	Africa	8
2021-11-08 13:37:33.201215	2021-11-08 13:37:33.201215	Oceania	9
2021-11-08 13:37:33.243426	2021-11-08 13:37:33.243426	Americas	10
\.


--
-- Data for Name: zone_members_country; Type: TABLE DATA; Schema: public; Owner: ghienan
--

COPY public.zone_members_country ("zoneId", "countryId") FROM stdin;
1	1
1	11
1	15
1	17
1	18
1	25
1	33
1	38
1	45
1	58
1	82
1	100
1	103
1	104
1	105
1	106
1	109
1	112
1	114
1	115
1	118
1	119
1	120
1	121
1	122
1	124
1	131
1	135
1	136
1	148
1	153
1	156
1	167
1	168
1	170
1	175
1	180
1	195
1	200
1	210
1	216
1	217
1	218
1	220
1	221
1	227
1	228
1	233
1	238
1	241
1	246
2	2
2	3
2	6
2	14
2	20
2	21
2	28
2	34
2	55
2	59
2	60
2	69
2	73
2	75
2	76
2	83
2	85
2	86
2	92
2	98
2	101
2	102
2	107
2	108
2	110
2	113
2	123
2	128
2	129
2	130
2	132
2	138
2	146
2	147
2	149
2	157
2	166
2	177
2	178
2	182
2	183
2	193
2	197
2	202
2	203
2	209
2	213
2	214
2	215
2	232
2	234
3	4
3	7
3	23
3	29
3	32
3	35
3	36
3	37
3	39
3	42
3	43
3	49
3	50
3	51
3	54
3	61
3	65
3	67
3	68
3	70
3	71
3	79
3	80
3	81
3	84
3	93
3	94
3	116
3	125
3	126
3	127
3	133
3	134
3	137
3	141
3	142
3	143
3	151
3	152
3	154
3	161
3	162
3	181
3	184
3	186
3	194
3	196
3	198
3	199
3	205
3	206
3	208
3	211
3	219
3	222
3	226
3	231
3	245
3	247
3	248
4	5
4	13
4	46
4	47
4	52
4	74
4	78
4	90
4	97
4	117
4	139
4	145
4	155
4	158
4	159
4	163
4	164
4	165
4	169
4	172
4	176
4	192
4	204
4	223
4	224
4	230
4	236
4	239
4	244
5	8
5	9
5	10
5	12
5	16
5	19
5	22
5	24
5	26
5	27
5	30
5	31
5	40
5	41
5	44
5	48
5	53
5	56
5	57
5	62
5	63
5	64
5	66
5	72
5	77
5	87
5	88
5	89
5	91
5	95
5	96
5	99
5	111
5	140
5	144
5	150
5	160
5	171
5	173
5	174
5	179
5	185
5	187
5	188
5	189
5	190
5	191
5	201
5	207
5	212
5	225
5	229
5	235
5	237
5	240
5	242
5	243
6	249
6	259
6	263
6	265
6	266
6	273
6	281
6	286
6	293
6	306
6	330
6	348
6	351
6	352
6	353
6	354
6	357
6	360
6	362
6	363
6	366
6	367
6	368
6	369
6	370
6	372
6	379
6	383
6	384
6	396
6	401
6	404
6	415
6	416
6	418
6	423
6	428
6	443
6	448
6	458
6	464
6	465
6	466
6	468
6	469
6	475
6	476
6	481
6	486
6	489
6	494
7	250
7	251
7	254
7	262
7	268
7	269
7	276
7	282
7	303
7	307
7	308
7	317
7	321
7	323
7	324
7	331
7	333
7	334
7	340
7	346
7	349
7	350
7	355
7	356
7	358
7	361
7	371
7	376
7	377
7	378
7	380
7	386
7	394
7	395
7	397
7	405
7	414
7	425
7	426
7	430
7	431
7	441
7	445
7	450
7	451
7	457
7	461
7	462
7	463
7	480
7	482
8	252
8	255
8	271
8	277
8	280
8	283
8	284
8	285
8	287
8	290
8	291
8	297
8	298
8	299
8	302
8	309
8	313
8	315
8	316
8	318
8	319
8	327
8	328
8	329
8	332
8	341
8	342
8	364
8	373
8	374
8	375
8	381
8	382
8	385
8	389
8	390
8	391
8	399
8	400
8	402
8	409
8	410
8	429
8	432
8	434
8	442
8	444
8	446
8	447
8	453
8	454
8	456
8	459
8	467
8	470
8	474
8	479
8	493
8	495
8	496
9	253
9	261
9	294
9	295
9	300
9	322
9	326
9	338
9	345
9	365
9	387
9	393
9	403
9	406
9	407
9	411
9	412
9	413
9	417
9	420
9	424
9	440
9	452
9	471
9	472
9	478
9	484
9	487
9	492
10	256
10	257
10	258
10	260
10	264
10	267
10	270
10	272
10	274
10	275
10	278
10	279
10	288
10	289
10	292
10	296
10	301
10	304
10	305
10	310
10	311
10	312
10	314
10	320
10	325
10	335
10	336
10	337
10	339
10	343
10	344
10	347
10	359
10	388
10	392
10	398
10	408
10	419
10	421
10	422
10	427
10	433
10	435
10	436
10	437
10	438
10	439
10	449
10	455
10	460
10	473
10	477
10	483
10	485
10	488
10	490
10	491
\.


--
-- Name: address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ghienan
--

SELECT pg_catalog.setval('public.address_id_seq', 1, false);


--
-- Name: administrator_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ghienan
--

SELECT pg_catalog.setval('public.administrator_id_seq', 1, true);


--
-- Name: asset_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ghienan
--

SELECT pg_catalog.setval('public.asset_id_seq', 108, true);


--
-- Name: authentication_method_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ghienan
--

SELECT pg_catalog.setval('public.authentication_method_id_seq', 1, true);


--
-- Name: channel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ghienan
--

SELECT pg_catalog.setval('public.channel_id_seq', 1, true);


--
-- Name: collection_asset_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ghienan
--

SELECT pg_catalog.setval('public.collection_asset_id_seq', 18, true);


--
-- Name: collection_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ghienan
--

SELECT pg_catalog.setval('public.collection_id_seq', 19, true);


--
-- Name: collection_translation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ghienan
--

SELECT pg_catalog.setval('public.collection_translation_id_seq', 19, true);


--
-- Name: country_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ghienan
--

SELECT pg_catalog.setval('public.country_id_seq', 496, true);


--
-- Name: country_translation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ghienan
--

SELECT pg_catalog.setval('public.country_translation_id_seq', 496, true);


--
-- Name: customer_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ghienan
--

SELECT pg_catalog.setval('public.customer_group_id_seq', 1, false);


--
-- Name: customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ghienan
--

SELECT pg_catalog.setval('public.customer_id_seq', 1, false);


--
-- Name: facet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ghienan
--

SELECT pg_catalog.setval('public.facet_id_seq', 5, true);


--
-- Name: facet_translation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ghienan
--

SELECT pg_catalog.setval('public.facet_translation_id_seq', 5, true);


--
-- Name: facet_value_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ghienan
--

SELECT pg_catalog.setval('public.facet_value_id_seq', 41, true);


--
-- Name: facet_value_translation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ghienan
--

SELECT pg_catalog.setval('public.facet_value_translation_id_seq', 41, true);


--
-- Name: fulfillment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ghienan
--

SELECT pg_catalog.setval('public.fulfillment_id_seq', 1, false);


--
-- Name: global_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ghienan
--

SELECT pg_catalog.setval('public.global_settings_id_seq', 1, true);


--
-- Name: history_entry_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ghienan
--

SELECT pg_catalog.setval('public.history_entry_id_seq', 1, false);


--
-- Name: job_record_buffer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ghienan
--

SELECT pg_catalog.setval('public.job_record_buffer_id_seq', 1, false);


--
-- Name: job_record_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ghienan
--

SELECT pg_catalog.setval('public.job_record_id_seq', 38, true);


--
-- Name: order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ghienan
--

SELECT pg_catalog.setval('public.order_id_seq', 1, false);


--
-- Name: order_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ghienan
--

SELECT pg_catalog.setval('public.order_item_id_seq', 1, false);


--
-- Name: order_line_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ghienan
--

SELECT pg_catalog.setval('public.order_line_id_seq', 1, false);


--
-- Name: order_modification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ghienan
--

SELECT pg_catalog.setval('public.order_modification_id_seq', 1, false);


--
-- Name: payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ghienan
--

SELECT pg_catalog.setval('public.payment_id_seq', 1, false);


--
-- Name: payment_method_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ghienan
--

SELECT pg_catalog.setval('public.payment_method_id_seq', 2, true);


--
-- Name: product_asset_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ghienan
--

SELECT pg_catalog.setval('public.product_asset_id_seq', 108, true);


--
-- Name: product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ghienan
--

SELECT pg_catalog.setval('public.product_id_seq', 108, true);


--
-- Name: product_option_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ghienan
--

SELECT pg_catalog.setval('public.product_option_group_id_seq', 30, true);


--
-- Name: product_option_group_translation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ghienan
--

SELECT pg_catalog.setval('public.product_option_group_translation_id_seq', 30, true);


--
-- Name: product_option_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ghienan
--

SELECT pg_catalog.setval('public.product_option_id_seq', 94, true);


--
-- Name: product_option_translation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ghienan
--

SELECT pg_catalog.setval('public.product_option_translation_id_seq', 94, true);


--
-- Name: product_translation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ghienan
--

SELECT pg_catalog.setval('public.product_translation_id_seq', 108, true);


--
-- Name: product_variant_asset_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ghienan
--

SELECT pg_catalog.setval('public.product_variant_asset_id_seq', 1, false);


--
-- Name: product_variant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ghienan
--

SELECT pg_catalog.setval('public.product_variant_id_seq', 176, true);


--
-- Name: product_variant_price_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ghienan
--

SELECT pg_catalog.setval('public.product_variant_price_id_seq', 176, true);


--
-- Name: product_variant_translation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ghienan
--

SELECT pg_catalog.setval('public.product_variant_translation_id_seq', 176, true);


--
-- Name: promotion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ghienan
--

SELECT pg_catalog.setval('public.promotion_id_seq', 1, false);


--
-- Name: refund_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ghienan
--

SELECT pg_catalog.setval('public.refund_id_seq', 1, false);


--
-- Name: role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ghienan
--

SELECT pg_catalog.setval('public.role_id_seq', 8, true);


--
-- Name: session_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ghienan
--

SELECT pg_catalog.setval('public.session_id_seq', 2, true);


--
-- Name: shipping_line_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ghienan
--

SELECT pg_catalog.setval('public.shipping_line_id_seq', 1, false);


--
-- Name: shipping_method_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ghienan
--

SELECT pg_catalog.setval('public.shipping_method_id_seq', 4, true);


--
-- Name: shipping_method_translation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ghienan
--

SELECT pg_catalog.setval('public.shipping_method_translation_id_seq', 4, true);


--
-- Name: stock_movement_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ghienan
--

SELECT pg_catalog.setval('public.stock_movement_id_seq', 176, true);


--
-- Name: surcharge_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ghienan
--

SELECT pg_catalog.setval('public.surcharge_id_seq', 1, false);


--
-- Name: tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ghienan
--

SELECT pg_catalog.setval('public.tag_id_seq', 1, false);


--
-- Name: tax_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ghienan
--

SELECT pg_catalog.setval('public.tax_category_id_seq', 6, true);


--
-- Name: tax_rate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ghienan
--

SELECT pg_catalog.setval('public.tax_rate_id_seq', 30, true);


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ghienan
--

SELECT pg_catalog.setval('public.user_id_seq', 1, true);


--
-- Name: zone_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ghienan
--

SELECT pg_catalog.setval('public.zone_id_seq', 10, true);


--
-- Name: order_promotions_promotion PK_001dfe7435f3946fbc2d66a4e92; Type: CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.order_promotions_promotion
    ADD CONSTRAINT "PK_001dfe7435f3946fbc2d66a4e92" PRIMARY KEY ("orderId", "promotionId");


--
-- Name: order_line PK_01a7c973d9f30479647e44f9892; Type: CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.order_line
    ADD CONSTRAINT "PK_01a7c973d9f30479647e44f9892" PRIMARY KEY (id);


--
-- Name: collection_channels_channel PK_0e292d80228c9b4a114d2b09476; Type: CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.collection_channels_channel
    ADD CONSTRAINT "PK_0e292d80228c9b4a114d2b09476" PRIMARY KEY ("collectionId", "channelId");


--
-- Name: customer_groups_customer_group PK_0f902789cba691ce7ebbc9fcaa6; Type: CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.customer_groups_customer_group
    ADD CONSTRAINT "PK_0f902789cba691ce7ebbc9fcaa6" PRIMARY KEY ("customerId", "customerGroupId");


--
-- Name: order PK_1031171c13130102495201e3e20; Type: CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT "PK_1031171c13130102495201e3e20" PRIMARY KEY (id);


--
-- Name: asset PK_1209d107fe21482beaea51b745e; Type: CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.asset
    ADD CONSTRAINT "PK_1209d107fe21482beaea51b745e" PRIMARY KEY (id);


--
-- Name: product_variant_channels_channel PK_1a10ca648c3d73c0f2b455ae191; Type: CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.product_variant_channels_channel
    ADD CONSTRAINT "PK_1a10ca648c3d73c0f2b455ae191" PRIMARY KEY ("productVariantId", "channelId");


--
-- Name: product_variant PK_1ab69c9935c61f7c70791ae0a9f; Type: CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.product_variant
    ADD CONSTRAINT "PK_1ab69c9935c61f7c70791ae0a9f" PRIMARY KEY (id);


--
-- Name: tax_rate PK_23b71b53f650c0b39e99ccef4fd; Type: CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.tax_rate
    ADD CONSTRAINT "PK_23b71b53f650c0b39e99ccef4fd" PRIMARY KEY (id);


--
-- Name: tax_category PK_2432988f825c336d5584a96cded; Type: CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.tax_category
    ADD CONSTRAINT "PK_2432988f825c336d5584a96cded" PRIMARY KEY (id);


--
-- Name: customer_channels_channel PK_27e2fa538c020889d32a0a784e8; Type: CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.customer_channels_channel
    ADD CONSTRAINT "PK_27e2fa538c020889d32a0a784e8" PRIMARY KEY ("customerId", "channelId");


--
-- Name: order_channels_channel PK_39853134b20afe9dfb25de18292; Type: CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.order_channels_channel
    ADD CONSTRAINT "PK_39853134b20afe9dfb25de18292" PRIMARY KEY ("orderId", "channelId");


--
-- Name: product_option_group_translation PK_44ab19f118175288dff147c4a00; Type: CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.product_option_group_translation
    ADD CONSTRAINT "PK_44ab19f118175288dff147c4a00" PRIMARY KEY (id);


--
-- Name: promotion_channels_channel PK_4b34f9b7bf95a8d3dc7f7f6dd23; Type: CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.promotion_channels_channel
    ADD CONSTRAINT "PK_4b34f9b7bf95a8d3dc7f7f6dd23" PRIMARY KEY ("promotionId", "channelId");


--
-- Name: product_variant_translation PK_4b7f882e2b669800bed7ed065f0; Type: CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.product_variant_translation
    ADD CONSTRAINT "PK_4b7f882e2b669800bed7ed065f0" PRIMARY KEY (id);


--
-- Name: product_option PK_4cf3c467e9bc764bdd32c4cd938; Type: CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.product_option
    ADD CONSTRAINT "PK_4cf3c467e9bc764bdd32c4cd938" PRIMARY KEY (id);


--
-- Name: fulfillment PK_50c102da132afffae660585981f; Type: CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.fulfillment
    ADD CONSTRAINT "PK_50c102da132afffae660585981f" PRIMARY KEY (id);


--
-- Name: collection_product_variants_product_variant PK_50c5ed0504ded53967be811f633; Type: CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.collection_product_variants_product_variant
    ADD CONSTRAINT "PK_50c5ed0504ded53967be811f633" PRIMARY KEY ("collectionId", "productVariantId");


--
-- Name: channel PK_590f33ee6ee7d76437acf362e39; Type: CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.channel
    ADD CONSTRAINT "PK_590f33ee6ee7d76437acf362e39" PRIMARY KEY (id);


--
-- Name: product_translation PK_62d00fbc92e7a495701d6fee9d5; Type: CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.product_translation
    ADD CONSTRAINT "PK_62d00fbc92e7a495701d6fee9d5" PRIMARY KEY (id);


--
-- Name: search_index_item PK_6470dd173311562c89e5f80b30e; Type: CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.search_index_item
    ADD CONSTRAINT "PK_6470dd173311562c89e5f80b30e" PRIMARY KEY ("languageCode", "productVariantId", "channelId");


--
-- Name: facet_value_channels_channel PK_653fb72a256f100f52c573e419f; Type: CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.facet_value_channels_channel
    ADD CONSTRAINT "PK_653fb72a256f100f52c573e419f" PRIMARY KEY ("facetValueId", "channelId");


--
-- Name: product_option_translation PK_69c79a84baabcad3c7328576ac0; Type: CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.product_option_translation
    ADD CONSTRAINT "PK_69c79a84baabcad3c7328576ac0" PRIMARY KEY (id);


--
-- Name: role_channels_channel PK_6fb9277e9f11bb8a63445c36242; Type: CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.role_channels_channel
    ADD CONSTRAINT "PK_6fb9277e9f11bb8a63445c36242" PRIMARY KEY ("roleId", "channelId");


--
-- Name: product_channels_channel PK_722acbcc06403e693b518d2c345; Type: CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.product_channels_channel
    ADD CONSTRAINT "PK_722acbcc06403e693b518d2c345" PRIMARY KEY ("productId", "channelId");


--
-- Name: payment_method PK_7744c2b2dd932c9cf42f2b9bc3a; Type: CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.payment_method
    ADD CONSTRAINT "PK_7744c2b2dd932c9cf42f2b9bc3a" PRIMARY KEY (id);


--
-- Name: job_record PK_88ce3ea0c9dca8b571450b457a7; Type: CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.job_record
    ADD CONSTRAINT "PK_88ce3ea0c9dca8b571450b457a7" PRIMARY KEY (id);


--
-- Name: customer_group PK_88e7da3ff7262d9e0a35aa3664e; Type: CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.customer_group
    ADD CONSTRAINT "PK_88e7da3ff7262d9e0a35aa3664e" PRIMARY KEY (id);


--
-- Name: shipping_line PK_890522bfc44a4b6eb7cb1e52609; Type: CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.shipping_line
    ADD CONSTRAINT "PK_890522bfc44a4b6eb7cb1e52609" PRIMARY KEY (id);


--
-- Name: tag PK_8e4052373c579afc1471f526760; Type: CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.tag
    ADD CONSTRAINT "PK_8e4052373c579afc1471f526760" PRIMARY KEY (id);


--
-- Name: country_translation PK_92b67bfadf41fa06682168b233b; Type: CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.country_translation
    ADD CONSTRAINT "PK_92b67bfadf41fa06682168b233b" PRIMARY KEY (id);


--
-- Name: job_record_buffer PK_9a1cfa02511065b32053efceeff; Type: CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.job_record_buffer
    ADD CONSTRAINT "PK_9a1cfa02511065b32053efceeff" PRIMARY KEY (id);


--
-- Name: stock_movement PK_9fe1232f916686ae8cf00294749; Type: CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.stock_movement
    ADD CONSTRAINT "PK_9fe1232f916686ae8cf00294749" PRIMARY KEY (id);


--
-- Name: facet_value_translation PK_a09fdeb788deff7a9ed827a6160; Type: CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.facet_value_translation
    ADD CONSTRAINT "PK_a09fdeb788deff7a9ed827a6160" PRIMARY KEY (id);


--
-- Name: facet PK_a0ebfe3c68076820c6886aa9ff3; Type: CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.facet
    ADD CONSTRAINT "PK_a0ebfe3c68076820c6886aa9ff3" PRIMARY KEY (id);


--
-- Name: product_variant_facet_values_facet_value PK_a28474836b2feeffcef98c806e1; Type: CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.product_variant_facet_values_facet_value
    ADD CONSTRAINT "PK_a28474836b2feeffcef98c806e1" PRIMARY KEY ("productVariantId", "facetValueId");


--
-- Name: collection_asset PK_a2adab6fd086adfb7858f1f110c; Type: CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.collection_asset
    ADD CONSTRAINT "PK_a2adab6fd086adfb7858f1f110c" PRIMARY KEY (id);


--
-- Name: zone_members_country PK_a61e80718248feb9092dd19eb68; Type: CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.zone_members_country
    ADD CONSTRAINT "PK_a61e80718248feb9092dd19eb68" PRIMARY KEY ("zoneId", "countryId");


--
-- Name: surcharge PK_a62b89257bcc802b5d77346f432; Type: CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.surcharge
    ADD CONSTRAINT "PK_a62b89257bcc802b5d77346f432" PRIMARY KEY (id);


--
-- Name: facet_translation PK_a6902cc1dcbb5e52a980f0189ad; Type: CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.facet_translation
    ADD CONSTRAINT "PK_a6902cc1dcbb5e52a980f0189ad" PRIMARY KEY (id);


--
-- Name: customer PK_a7a13f4cacb744524e44dfdad32; Type: CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT "PK_a7a13f4cacb744524e44dfdad32" PRIMARY KEY (id);


--
-- Name: order_modification_order_items_order_item PK_a930dbed390bdf667959c41a2f5; Type: CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.order_modification_order_items_order_item
    ADD CONSTRAINT "PK_a930dbed390bdf667959c41a2f5" PRIMARY KEY ("orderModificationId", "orderItemId");


--
-- Name: collection PK_ad3f485bbc99d875491f44d7c85; Type: CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.collection
    ADD CONSTRAINT "PK_ad3f485bbc99d875491f44d7c85" PRIMARY KEY (id);


--
-- Name: role PK_b36bcfe02fc8de3c57a8b2391c2; Type: CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT "PK_b36bcfe02fc8de3c57a8b2391c2" PRIMARY KEY (id);


--
-- Name: user_roles_role PK_b47cd6c84ee205ac5a713718292; Type: CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.user_roles_role
    ADD CONSTRAINT "PK_b47cd6c84ee205ac5a713718292" PRIMARY KEY ("userId", "roleId");


--
-- Name: history_entry PK_b65bd95b0d2929668589d57b97a; Type: CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.history_entry
    ADD CONSTRAINT "PK_b65bd95b0d2929668589d57b97a" PRIMARY KEY (id);


--
-- Name: shipping_method_translation PK_b862a1fac1c6e1fd201eadadbcb; Type: CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.shipping_method_translation
    ADD CONSTRAINT "PK_b862a1fac1c6e1fd201eadadbcb" PRIMARY KEY (id);


--
-- Name: shipping_method PK_b9b0adfad3c6b99229c1e7d4865; Type: CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.shipping_method
    ADD CONSTRAINT "PK_b9b0adfad3c6b99229c1e7d4865" PRIMARY KEY (id);


--
-- Name: product_variant_price PK_ba659ff2940702124e799c5c854; Type: CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.product_variant_price
    ADD CONSTRAINT "PK_ba659ff2940702124e799c5c854" PRIMARY KEY (id);


--
-- Name: collection_translation PK_bb49cfcde50401eb5f463a84dac; Type: CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.collection_translation
    ADD CONSTRAINT "PK_bb49cfcde50401eb5f463a84dac" PRIMARY KEY (id);


--
-- Name: zone PK_bd3989e5a3c3fb5ed546dfaf832; Type: CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.zone
    ADD CONSTRAINT "PK_bd3989e5a3c3fb5ed546dfaf832" PRIMARY KEY (id);


--
-- Name: product PK_bebc9158e480b949565b4dc7a82; Type: CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT "PK_bebc9158e480b949565b4dc7a82" PRIMARY KEY (id);


--
-- Name: country PK_bf6e37c231c4f4ea56dcd887269; Type: CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT "PK_bf6e37c231c4f4ea56dcd887269" PRIMARY KEY (id);


--
-- Name: asset_tags_tag PK_c4113b84381e953901fa5553654; Type: CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.asset_tags_tag
    ADD CONSTRAINT "PK_c4113b84381e953901fa5553654" PRIMARY KEY ("assetId", "tagId");


--
-- Name: product_asset PK_c56a83efd14ec4175532e1867fc; Type: CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.product_asset
    ADD CONSTRAINT "PK_c56a83efd14ec4175532e1867fc" PRIMARY KEY (id);


--
-- Name: product_variant_options_product_option PK_c57de5cb6bb74504180604a00c0; Type: CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.product_variant_options_product_option
    ADD CONSTRAINT "PK_c57de5cb6bb74504180604a00c0" PRIMARY KEY ("productVariantId", "productOptionId");


--
-- Name: payment_method_channels_channel PK_c83e4a201c0402ce5cdb170a9a2; Type: CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.payment_method_channels_channel
    ADD CONSTRAINT "PK_c83e4a201c0402ce5cdb170a9a2" PRIMARY KEY ("paymentMethodId", "channelId");


--
-- Name: shipping_method_channels_channel PK_c92b2b226a6ee87888d8dcd8bd6; Type: CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.shipping_method_channels_channel
    ADD CONSTRAINT "PK_c92b2b226a6ee87888d8dcd8bd6" PRIMARY KEY ("shippingMethodId", "channelId");


--
-- Name: user PK_cace4a159ff9f2512dd42373760; Type: CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT "PK_cace4a159ff9f2512dd42373760" PRIMARY KEY (id);


--
-- Name: product_variant_asset PK_cb1e33ae13779da176f8b03a5d3; Type: CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.product_variant_asset
    ADD CONSTRAINT "PK_cb1e33ae13779da176f8b03a5d3" PRIMARY KEY (id);


--
-- Name: order_modification PK_cccf2e1612694eeb1e5b6760ffa; Type: CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.order_modification
    ADD CONSTRAINT "PK_cccf2e1612694eeb1e5b6760ffa" PRIMARY KEY (id);


--
-- Name: order_item PK_d01158fe15b1ead5c26fd7f4e90; Type: CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.order_item
    ADD CONSTRAINT "PK_d01158fe15b1ead5c26fd7f4e90" PRIMARY KEY (id);


--
-- Name: facet_value PK_d231e8eecc7e1a6059e1da7d325; Type: CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.facet_value
    ADD CONSTRAINT "PK_d231e8eecc7e1a6059e1da7d325" PRIMARY KEY (id);


--
-- Name: product_facet_values_facet_value PK_d57f06b38805181019d75662aa6; Type: CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.product_facet_values_facet_value
    ADD CONSTRAINT "PK_d57f06b38805181019d75662aa6" PRIMARY KEY ("productId", "facetValueId");


--
-- Name: product_option_group PK_d76e92fdbbb5a2e6752ffd4a2c1; Type: CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.product_option_group
    ADD CONSTRAINT "PK_d76e92fdbbb5a2e6752ffd4a2c1" PRIMARY KEY (id);


--
-- Name: address PK_d92de1f82754668b5f5f5dd4fd5; Type: CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.address
    ADD CONSTRAINT "PK_d92de1f82754668b5f5f5dd4fd5" PRIMARY KEY (id);


--
-- Name: asset_channels_channel PK_d943908a39e32952e8425d2f1ba; Type: CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.asset_channels_channel
    ADD CONSTRAINT "PK_d943908a39e32952e8425d2f1ba" PRIMARY KEY ("assetId", "channelId");


--
-- Name: facet_channels_channel PK_df0579886093b2f830c159adfde; Type: CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.facet_channels_channel
    ADD CONSTRAINT "PK_df0579886093b2f830c159adfde" PRIMARY KEY ("facetId", "channelId");


--
-- Name: authentication_method PK_e204686018c3c60f6164e385081; Type: CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.authentication_method
    ADD CONSTRAINT "PK_e204686018c3c60f6164e385081" PRIMARY KEY (id);


--
-- Name: administrator PK_ee58e71b3b4008b20ddc7b3092b; Type: CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.administrator
    ADD CONSTRAINT "PK_ee58e71b3b4008b20ddc7b3092b" PRIMARY KEY (id);


--
-- Name: order_item_fulfillments_fulfillment PK_efd1c390f21a42e083d13c1e36c; Type: CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.order_item_fulfillments_fulfillment
    ADD CONSTRAINT "PK_efd1c390f21a42e083d13c1e36c" PRIMARY KEY ("orderItemId", "fulfillmentId");


--
-- Name: refund PK_f1cefa2e60d99b206c46c1116e5; Type: CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.refund
    ADD CONSTRAINT "PK_f1cefa2e60d99b206c46c1116e5" PRIMARY KEY (id);


--
-- Name: session PK_f55da76ac1c3ac420f444d2ff11; Type: CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.session
    ADD CONSTRAINT "PK_f55da76ac1c3ac420f444d2ff11" PRIMARY KEY (id);


--
-- Name: promotion PK_fab3630e0789a2002f1cadb7d38; Type: CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.promotion
    ADD CONSTRAINT "PK_fab3630e0789a2002f1cadb7d38" PRIMARY KEY (id);


--
-- Name: payment PK_fcaec7df5adf9cac408c686b2ab; Type: CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT "PK_fcaec7df5adf9cac408c686b2ab" PRIMARY KEY (id);


--
-- Name: global_settings PK_fec5e2c0bf238e30b25d4a82976; Type: CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.global_settings
    ADD CONSTRAINT "PK_fec5e2c0bf238e30b25d4a82976" PRIMARY KEY (id);


--
-- Name: administrator REL_1966e18ce6a39a82b19204704d; Type: CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.administrator
    ADD CONSTRAINT "REL_1966e18ce6a39a82b19204704d" UNIQUE ("userId");


--
-- Name: customer REL_3f62b42ed23958b120c235f74d; Type: CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT "REL_3f62b42ed23958b120c235f74d" UNIQUE ("userId");


--
-- Name: order_modification REL_ad2991fa2933ed8b7f86a71633; Type: CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.order_modification
    ADD CONSTRAINT "REL_ad2991fa2933ed8b7f86a71633" UNIQUE ("paymentId");


--
-- Name: order_modification REL_cb66b63b6e97613013795eadbd; Type: CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.order_modification
    ADD CONSTRAINT "REL_cb66b63b6e97613013795eadbd" UNIQUE ("refundId");


--
-- Name: channel UQ_06127ac6c6d913f4320759971db; Type: CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.channel
    ADD CONSTRAINT "UQ_06127ac6c6d913f4320759971db" UNIQUE (code);


--
-- Name: facet UQ_0c9a5d053fdf4ebb5f0490b40fd; Type: CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.facet
    ADD CONSTRAINT "UQ_0c9a5d053fdf4ebb5f0490b40fd" UNIQUE (code);


--
-- Name: administrator UQ_154f5c538b1576ccc277b1ed631; Type: CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.administrator
    ADD CONSTRAINT "UQ_154f5c538b1576ccc277b1ed631" UNIQUE ("emailAddress");


--
-- Name: channel UQ_842699fce4f3470a7d06d89de88; Type: CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.channel
    ADD CONSTRAINT "UQ_842699fce4f3470a7d06d89de88" UNIQUE (token);


--
-- Name: IDX_06e7d73673ee630e8ec50d0b29; Type: INDEX; Schema: public; Owner: ghienan
--

CREATE INDEX "IDX_06e7d73673ee630e8ec50d0b29" ON public.product_facet_values_facet_value USING btree ("facetValueId");


--
-- Name: IDX_0d641b761ed1dce4ef3cd33d55; Type: INDEX; Schema: public; Owner: ghienan
--

CREATE INDEX "IDX_0d641b761ed1dce4ef3cd33d55" ON public.product_variant_facet_values_facet_value USING btree ("facetValueId");


--
-- Name: IDX_0d8e5c204480204a60e151e485; Type: INDEX; Schema: public; Owner: ghienan
--

CREATE INDEX "IDX_0d8e5c204480204a60e151e485" ON public.order_channels_channel USING btree ("orderId");


--
-- Name: IDX_0eaaf0f4b6c69afde1e88ffb52; Type: INDEX; Schema: public; Owner: ghienan
--

CREATE INDEX "IDX_0eaaf0f4b6c69afde1e88ffb52" ON public.promotion_channels_channel USING btree ("channelId");


--
-- Name: IDX_16ca9151a5153f1169da5b7b7e; Type: INDEX; Schema: public; Owner: ghienan
--

CREATE INDEX "IDX_16ca9151a5153f1169da5b7b7e" ON public.asset_channels_channel USING btree ("channelId");


--
-- Name: IDX_232f8e85d7633bd6ddfad42169; Type: INDEX; Schema: public; Owner: ghienan
--

CREATE UNIQUE INDEX "IDX_232f8e85d7633bd6ddfad42169" ON public.session USING btree (token);


--
-- Name: IDX_26d12be3b5fec6c4adb1d79284; Type: INDEX; Schema: public; Owner: ghienan
--

CREATE INDEX "IDX_26d12be3b5fec6c4adb1d79284" ON public.product_channels_channel USING btree ("productId");


--
-- Name: IDX_2a8ea404d05bf682516184db7d; Type: INDEX; Schema: public; Owner: ghienan
--

CREATE INDEX "IDX_2a8ea404d05bf682516184db7d" ON public.facet_channels_channel USING btree ("channelId");


--
-- Name: IDX_2c26b988769c0e3b0120bdef31; Type: INDEX; Schema: public; Owner: ghienan
--

CREATE INDEX "IDX_2c26b988769c0e3b0120bdef31" ON public.order_promotions_promotion USING btree ("promotionId");


--
-- Name: IDX_4be2f7adf862634f5f803d246b; Type: INDEX; Schema: public; Owner: ghienan
--

CREATE INDEX "IDX_4be2f7adf862634f5f803d246b" ON public.user_roles_role USING btree ("roleId");


--
-- Name: IDX_526f0131260eec308a3bd2b61b; Type: INDEX; Schema: public; Owner: ghienan
--

CREATE INDEX "IDX_526f0131260eec308a3bd2b61b" ON public.product_variant_options_product_option USING btree ("productVariantId");


--
-- Name: IDX_5bcb569635ce5407eb3f264487; Type: INDEX; Schema: public; Owner: ghienan
--

CREATE INDEX "IDX_5bcb569635ce5407eb3f264487" ON public.payment_method_channels_channel USING btree ("paymentMethodId");


--
-- Name: IDX_5f9286e6c25594c6b88c108db7; Type: INDEX; Schema: public; Owner: ghienan
--

CREATE INDEX "IDX_5f9286e6c25594c6b88c108db7" ON public.user_roles_role USING btree ("userId");


--
-- Name: IDX_67be0e40122ab30a62a9817efe; Type: INDEX; Schema: public; Owner: ghienan
--

CREATE INDEX "IDX_67be0e40122ab30a62a9817efe" ON public.order_promotions_promotion USING btree ("orderId");


--
-- Name: IDX_69567bc225b6bbbd732d6c5455; Type: INDEX; Schema: public; Owner: ghienan
--

CREATE INDEX "IDX_69567bc225b6bbbd732d6c5455" ON public.product_variant_facet_values_facet_value USING btree ("productVariantId");


--
-- Name: IDX_6a0558e650d75ae639ff38e413; Type: INDEX; Schema: public; Owner: ghienan
--

CREATE INDEX "IDX_6a0558e650d75ae639ff38e413" ON public.product_facet_values_facet_value USING btree ("productId");


--
-- Name: IDX_6d9e2c39ab12391aaa374bcdaa; Type: INDEX; Schema: public; Owner: ghienan
--

CREATE INDEX "IDX_6d9e2c39ab12391aaa374bcdaa" ON public.promotion_channels_channel USING btree ("promotionId");


--
-- Name: IDX_6faa7b72422d9c4679e2f186ad; Type: INDEX; Schema: public; Owner: ghienan
--

CREATE INDEX "IDX_6faa7b72422d9c4679e2f186ad" ON public.collection_product_variants_product_variant USING btree ("collectionId");


--
-- Name: IDX_6fb55742e13e8082954d0436dc; Type: INDEX; Schema: public; Owner: ghienan
--

CREATE INDEX "IDX_6fb55742e13e8082954d0436dc" ON public.search_index_item USING btree ("productName");


--
-- Name: IDX_7216ab24077cf5cbece7857dbb; Type: INDEX; Schema: public; Owner: ghienan
--

CREATE INDEX "IDX_7216ab24077cf5cbece7857dbb" ON public.collection_channels_channel USING btree ("channelId");


--
-- Name: IDX_7350d77b6474313fbbaf4b094c; Type: INDEX; Schema: public; Owner: ghienan
--

CREATE INDEX "IDX_7350d77b6474313fbbaf4b094c" ON public.zone_members_country USING btree ("zoneId");


--
-- Name: IDX_7baeecaf955e54bec73f998b0d; Type: INDEX; Schema: public; Owner: ghienan
--

CREATE INDEX "IDX_7baeecaf955e54bec73f998b0d" ON public.zone_members_country USING btree ("countryId");


--
-- Name: IDX_8132041a647c28eb27ecc1691f; Type: INDEX; Schema: public; Owner: ghienan
--

CREATE INDEX "IDX_8132041a647c28eb27ecc1691f" ON public.order_item_fulfillments_fulfillment USING btree ("fulfillmentId");


--
-- Name: IDX_85feea3f0e5e82133605f78db0; Type: INDEX; Schema: public; Owner: ghienan
--

CREATE INDEX "IDX_85feea3f0e5e82133605f78db0" ON public.customer_groups_customer_group USING btree ("customerGroupId");


--
-- Name: IDX_94e15d5f12d355d117390131ac; Type: INDEX; Schema: public; Owner: ghienan
--

CREATE INDEX "IDX_94e15d5f12d355d117390131ac" ON public.stock_movement USING btree (discriminator);


--
-- Name: IDX_9a5a6a556f75c4ac7bfdd03410; Type: INDEX; Schema: public; Owner: ghienan
--

CREATE INDEX "IDX_9a5a6a556f75c4ac7bfdd03410" ON public.search_index_item USING btree (description);


--
-- Name: IDX_9d631d7bd3d44af50eca535d72; Type: INDEX; Schema: public; Owner: ghienan
--

CREATE INDEX "IDX_9d631d7bd3d44af50eca535d72" ON public.order_modification_order_items_order_item USING btree ("orderItemId");


--
-- Name: IDX_9e412b00d4c6cee1a4b3d92071; Type: INDEX; Schema: public; Owner: ghienan
--

CREATE INDEX "IDX_9e412b00d4c6cee1a4b3d92071" ON public.asset_tags_tag USING btree ("assetId");


--
-- Name: IDX_a23445b2c942d8dfcae15b8de2; Type: INDEX; Schema: public; Owner: ghienan
--

CREATE INDEX "IDX_a23445b2c942d8dfcae15b8de2" ON public.authentication_method USING btree (type);


--
-- Name: IDX_a48502a38aded69d087a8ec08a; Type: INDEX; Schema: public; Owner: ghienan
--

CREATE INDEX "IDX_a48502a38aded69d087a8ec08a" ON public.order_modification_order_items_order_item USING btree ("orderModificationId");


--
-- Name: IDX_a51dfbd87c330c075c39832b6e; Type: INDEX; Schema: public; Owner: ghienan
--

CREATE INDEX "IDX_a51dfbd87c330c075c39832b6e" ON public.product_channels_channel USING btree ("channelId");


--
-- Name: IDX_a568a3d5aa7f237edab624960b; Type: INDEX; Schema: public; Owner: ghienan
--

CREATE INDEX "IDX_a568a3d5aa7f237edab624960b" ON public.order_item_fulfillments_fulfillment USING btree ("orderItemId");


--
-- Name: IDX_a842c9fe8cd4c8ff31402d172d; Type: INDEX; Schema: public; Owner: ghienan
--

CREATE INDEX "IDX_a842c9fe8cd4c8ff31402d172d" ON public.customer_channels_channel USING btree ("customerId");


--
-- Name: IDX_ad690c1b05596d7f52e52ffeed; Type: INDEX; Schema: public; Owner: ghienan
--

CREATE INDEX "IDX_ad690c1b05596d7f52e52ffeed" ON public.facet_value_channels_channel USING btree ("facetValueId");


--
-- Name: IDX_b823a3c8bf3b78d3ed68736485; Type: INDEX; Schema: public; Owner: ghienan
--

CREATE INDEX "IDX_b823a3c8bf3b78d3ed68736485" ON public.customer_groups_customer_group USING btree ("customerId");


--
-- Name: IDX_beeb2b3cd800e589f2213ae99d; Type: INDEX; Schema: public; Owner: ghienan
--

CREATE INDEX "IDX_beeb2b3cd800e589f2213ae99d" ON public.product_variant_channels_channel USING btree ("productVariantId");


--
-- Name: IDX_bfd2a03e9988eda6a9d1176011; Type: INDEX; Schema: public; Owner: ghienan
--

CREATE INDEX "IDX_bfd2a03e9988eda6a9d1176011" ON public.role_channels_channel USING btree ("roleId");


--
-- Name: IDX_c00e36f667d35031087b382e61; Type: INDEX; Schema: public; Owner: ghienan
--

CREATE INDEX "IDX_c00e36f667d35031087b382e61" ON public.payment_method_channels_channel USING btree ("channelId");


--
-- Name: IDX_ca796020c6d097e251e5d6d2b0; Type: INDEX; Schema: public; Owner: ghienan
--

CREATE INDEX "IDX_ca796020c6d097e251e5d6d2b0" ON public.facet_channels_channel USING btree ("facetId");


--
-- Name: IDX_cdbf33ffb5d451916125152008; Type: INDEX; Schema: public; Owner: ghienan
--

CREATE INDEX "IDX_cdbf33ffb5d451916125152008" ON public.collection_channels_channel USING btree ("collectionId");


--
-- Name: IDX_d0d16db872499e83b15999f8c7; Type: INDEX; Schema: public; Owner: ghienan
--

CREATE INDEX "IDX_d0d16db872499e83b15999f8c7" ON public.order_channels_channel USING btree ("channelId");


--
-- Name: IDX_d194bff171b62357688a5d0f55; Type: INDEX; Schema: public; Owner: ghienan
--

CREATE INDEX "IDX_d194bff171b62357688a5d0f55" ON public.product_variant_channels_channel USING btree ("channelId");


--
-- Name: IDX_d8791f444a8bf23fe4c1bc020c; Type: INDEX; Schema: public; Owner: ghienan
--

CREATE INDEX "IDX_d8791f444a8bf23fe4c1bc020c" ON public.search_index_item USING btree ("productVariantName");


--
-- Name: IDX_dc4e7435f9f5e9e6436bebd33b; Type: INDEX; Schema: public; Owner: ghienan
--

CREATE INDEX "IDX_dc4e7435f9f5e9e6436bebd33b" ON public.asset_channels_channel USING btree ("assetId");


--
-- Name: IDX_dc9f69207a8867f83b0fd257e3; Type: INDEX; Schema: public; Owner: ghienan
--

CREATE INDEX "IDX_dc9f69207a8867f83b0fd257e3" ON public.customer_channels_channel USING btree ("channelId");


--
-- Name: IDX_e09dfee62b158307404202b43a; Type: INDEX; Schema: public; Owner: ghienan
--

CREATE INDEX "IDX_e09dfee62b158307404202b43a" ON public.role_channels_channel USING btree ("channelId");


--
-- Name: IDX_e1d54c0b9db3e2eb17faaf5919; Type: INDEX; Schema: public; Owner: ghienan
--

CREATE INDEX "IDX_e1d54c0b9db3e2eb17faaf5919" ON public.facet_value_channels_channel USING btree ("channelId");


--
-- Name: IDX_e5598363000cab9d9116bd5835; Type: INDEX; Schema: public; Owner: ghienan
--

CREATE INDEX "IDX_e5598363000cab9d9116bd5835" ON public.session USING btree (type);


--
-- Name: IDX_e96a71affe63c97f7fa2f076da; Type: INDEX; Schema: public; Owner: ghienan
--

CREATE INDEX "IDX_e96a71affe63c97f7fa2f076da" ON public.product_variant_options_product_option USING btree ("productOptionId");


--
-- Name: IDX_f0a17b94aa5a162f0d422920eb; Type: INDEX; Schema: public; Owner: ghienan
--

CREATE INDEX "IDX_f0a17b94aa5a162f0d422920eb" ON public.shipping_method_channels_channel USING btree ("shippingMethodId");


--
-- Name: IDX_f2b98dfb56685147bed509acc3; Type: INDEX; Schema: public; Owner: ghienan
--

CREATE INDEX "IDX_f2b98dfb56685147bed509acc3" ON public.shipping_method_channels_channel USING btree ("channelId");


--
-- Name: IDX_f3a761f6bcfabb474b11e1e51f; Type: INDEX; Schema: public; Owner: ghienan
--

CREATE INDEX "IDX_f3a761f6bcfabb474b11e1e51f" ON public.history_entry USING btree (discriminator);


--
-- Name: IDX_fb05887e2867365f236d7dd95e; Type: INDEX; Schema: public; Owner: ghienan
--

CREATE INDEX "IDX_fb05887e2867365f236d7dd95e" ON public.collection_product_variants_product_variant USING btree ("productVariantId");


--
-- Name: IDX_fb5e800171ffbe9823f2cc727f; Type: INDEX; Schema: public; Owner: ghienan
--

CREATE INDEX "IDX_fb5e800171ffbe9823f2cc727f" ON public.asset_tags_tag USING btree ("tagId");


--
-- Name: authentication_method FK_00cbe87bc0d4e36758d61bd31d6; Type: FK CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.authentication_method
    ADD CONSTRAINT "FK_00cbe87bc0d4e36758d61bd31d6" FOREIGN KEY ("userId") REFERENCES public."user"(id);


--
-- Name: product_facet_values_facet_value FK_06e7d73673ee630e8ec50d0b29f; Type: FK CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.product_facet_values_facet_value
    ADD CONSTRAINT "FK_06e7d73673ee630e8ec50d0b29f" FOREIGN KEY ("facetValueId") REFERENCES public.facet_value(id) ON DELETE CASCADE;


--
-- Name: product_asset FK_0d1294f5c22a56da7845ebab72c; Type: FK CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.product_asset
    ADD CONSTRAINT "FK_0d1294f5c22a56da7845ebab72c" FOREIGN KEY ("productId") REFERENCES public.product(id) ON DELETE CASCADE;


--
-- Name: product_variant_facet_values_facet_value FK_0d641b761ed1dce4ef3cd33d559; Type: FK CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.product_variant_facet_values_facet_value
    ADD CONSTRAINT "FK_0d641b761ed1dce4ef3cd33d559" FOREIGN KEY ("facetValueId") REFERENCES public.facet_value(id) ON DELETE CASCADE;


--
-- Name: order_channels_channel FK_0d8e5c204480204a60e151e4853; Type: FK CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.order_channels_channel
    ADD CONSTRAINT "FK_0d8e5c204480204a60e151e4853" FOREIGN KEY ("orderId") REFERENCES public."order"(id) ON DELETE CASCADE;


--
-- Name: product_variant FK_0e6f516053cf982b537836e21cf; Type: FK CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.product_variant
    ADD CONSTRAINT "FK_0e6f516053cf982b537836e21cf" FOREIGN KEY ("featuredAssetId") REFERENCES public.asset(id) ON DELETE SET NULL;


--
-- Name: promotion_channels_channel FK_0eaaf0f4b6c69afde1e88ffb52d; Type: FK CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.promotion_channels_channel
    ADD CONSTRAINT "FK_0eaaf0f4b6c69afde1e88ffb52d" FOREIGN KEY ("channelId") REFERENCES public.channel(id) ON DELETE CASCADE;


--
-- Name: product_variant_asset FK_10b5a2e3dee0e30b1e26c32f5c7; Type: FK CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.product_variant_asset
    ADD CONSTRAINT "FK_10b5a2e3dee0e30b1e26c32f5c7" FOREIGN KEY ("assetId") REFERENCES public.asset(id) ON DELETE CASCADE;


--
-- Name: order FK_124456e637cca7a415897dce659; Type: FK CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT "FK_124456e637cca7a415897dce659" FOREIGN KEY ("customerId") REFERENCES public.customer(id);


--
-- Name: surcharge FK_154eb685f9b629033bd266df7fa; Type: FK CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.surcharge
    ADD CONSTRAINT "FK_154eb685f9b629033bd266df7fa" FOREIGN KEY ("orderId") REFERENCES public."order"(id) ON DELETE CASCADE;


--
-- Name: asset_channels_channel FK_16ca9151a5153f1169da5b7b7e3; Type: FK CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.asset_channels_channel
    ADD CONSTRAINT "FK_16ca9151a5153f1169da5b7b7e3" FOREIGN KEY ("channelId") REFERENCES public.channel(id) ON DELETE CASCADE;


--
-- Name: administrator FK_1966e18ce6a39a82b19204704d7; Type: FK CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.administrator
    ADD CONSTRAINT "FK_1966e18ce6a39a82b19204704d7" FOREIGN KEY ("userId") REFERENCES public."user"(id);


--
-- Name: refund FK_1c6932a756108788a361e7d4404; Type: FK CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.refund
    ADD CONSTRAINT "FK_1c6932a756108788a361e7d4404" FOREIGN KEY ("paymentId") REFERENCES public.payment(id);


--
-- Name: order_modification FK_1df5bc14a47ef24d2e681f45598; Type: FK CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.order_modification
    ADD CONSTRAINT "FK_1df5bc14a47ef24d2e681f45598" FOREIGN KEY ("orderId") REFERENCES public."order"(id) ON DELETE CASCADE;


--
-- Name: collection_asset FK_1ed9e48dfbf74b5fcbb35d3d686; Type: FK CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.collection_asset
    ADD CONSTRAINT "FK_1ed9e48dfbf74b5fcbb35d3d686" FOREIGN KEY ("collectionId") REFERENCES public.collection(id) ON DELETE CASCADE;


--
-- Name: country_translation FK_20958e5bdb4c996c18ca63d18e4; Type: FK CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.country_translation
    ADD CONSTRAINT "FK_20958e5bdb4c996c18ca63d18e4" FOREIGN KEY ("baseId") REFERENCES public.country(id) ON DELETE CASCADE;


--
-- Name: order_line FK_239cfca2a55b98b90b6bef2e44f; Type: FK CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.order_line
    ADD CONSTRAINT "FK_239cfca2a55b98b90b6bef2e44f" FOREIGN KEY ("orderId") REFERENCES public."order"(id) ON DELETE CASCADE;


--
-- Name: product_channels_channel FK_26d12be3b5fec6c4adb1d792844; Type: FK CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.product_channels_channel
    ADD CONSTRAINT "FK_26d12be3b5fec6c4adb1d792844" FOREIGN KEY ("productId") REFERENCES public.product(id) ON DELETE CASCADE;


--
-- Name: facet_channels_channel FK_2a8ea404d05bf682516184db7d3; Type: FK CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.facet_channels_channel
    ADD CONSTRAINT "FK_2a8ea404d05bf682516184db7d3" FOREIGN KEY ("channelId") REFERENCES public.channel(id) ON DELETE CASCADE;


--
-- Name: order_promotions_promotion FK_2c26b988769c0e3b0120bdef31b; Type: FK CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.order_promotions_promotion
    ADD CONSTRAINT "FK_2c26b988769c0e3b0120bdef31b" FOREIGN KEY ("promotionId") REFERENCES public.promotion(id) ON DELETE CASCADE;


--
-- Name: history_entry FK_3a05127e67435b4d2332ded7c9e; Type: FK CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.history_entry
    ADD CONSTRAINT "FK_3a05127e67435b4d2332ded7c9e" FOREIGN KEY ("orderId") REFERENCES public."order"(id) ON DELETE CASCADE;


--
-- Name: session FK_3d2f174ef04fb312fdebd0ddc53; Type: FK CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.session
    ADD CONSTRAINT "FK_3d2f174ef04fb312fdebd0ddc53" FOREIGN KEY ("userId") REFERENCES public."user"(id);


--
-- Name: facet_value_translation FK_3d6e45823b65de808a66cb1423b; Type: FK CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.facet_value_translation
    ADD CONSTRAINT "FK_3d6e45823b65de808a66cb1423b" FOREIGN KEY ("baseId") REFERENCES public.facet_value(id) ON DELETE CASCADE;


--
-- Name: order_item FK_3e5161133689fba526377cbccd3; Type: FK CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.order_item
    ADD CONSTRAINT "FK_3e5161133689fba526377cbccd3" FOREIGN KEY ("refundId") REFERENCES public.refund(id);


--
-- Name: customer FK_3f62b42ed23958b120c235f74df; Type: FK CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT "FK_3f62b42ed23958b120c235f74df" FOREIGN KEY ("userId") REFERENCES public."user"(id);


--
-- Name: product_variant_translation FK_420f4d6fb75d38b9dca79bc43b4; Type: FK CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.product_variant_translation
    ADD CONSTRAINT "FK_420f4d6fb75d38b9dca79bc43b4" FOREIGN KEY ("baseId") REFERENCES public.product_variant(id);


--
-- Name: collection FK_4257b61275144db89fa0f5dc059; Type: FK CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.collection
    ADD CONSTRAINT "FK_4257b61275144db89fa0f5dc059" FOREIGN KEY ("parentId") REFERENCES public.collection(id);


--
-- Name: history_entry FK_43ac602f839847fdb91101f30ec; Type: FK CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.history_entry
    ADD CONSTRAINT "FK_43ac602f839847fdb91101f30ec" FOREIGN KEY ("customerId") REFERENCES public.customer(id) ON DELETE CASCADE;


--
-- Name: user_roles_role FK_4be2f7adf862634f5f803d246b8; Type: FK CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.user_roles_role
    ADD CONSTRAINT "FK_4be2f7adf862634f5f803d246b8" FOREIGN KEY ("roleId") REFERENCES public.role(id) ON DELETE CASCADE;


--
-- Name: collection_asset FK_51da53b26522dc0525762d2de8e; Type: FK CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.collection_asset
    ADD CONSTRAINT "FK_51da53b26522dc0525762d2de8e" FOREIGN KEY ("assetId") REFERENCES public.asset(id) ON DELETE CASCADE;


--
-- Name: product_variant_options_product_option FK_526f0131260eec308a3bd2b61b6; Type: FK CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.product_variant_options_product_option
    ADD CONSTRAINT "FK_526f0131260eec308a3bd2b61b6" FOREIGN KEY ("productVariantId") REFERENCES public.product_variant(id) ON DELETE CASCADE;


--
-- Name: product_asset FK_5888ac17b317b93378494a10620; Type: FK CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.product_asset
    ADD CONSTRAINT "FK_5888ac17b317b93378494a10620" FOREIGN KEY ("assetId") REFERENCES public.asset(id) ON DELETE CASCADE;


--
-- Name: payment_method_channels_channel FK_5bcb569635ce5407eb3f264487d; Type: FK CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.payment_method_channels_channel
    ADD CONSTRAINT "FK_5bcb569635ce5407eb3f264487d" FOREIGN KEY ("paymentMethodId") REFERENCES public.payment_method(id) ON DELETE CASCADE;


--
-- Name: user_roles_role FK_5f9286e6c25594c6b88c108db77; Type: FK CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.user_roles_role
    ADD CONSTRAINT "FK_5f9286e6c25594c6b88c108db77" FOREIGN KEY ("userId") REFERENCES public."user"(id) ON DELETE CASCADE;


--
-- Name: order_promotions_promotion FK_67be0e40122ab30a62a9817efe0; Type: FK CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.order_promotions_promotion
    ADD CONSTRAINT "FK_67be0e40122ab30a62a9817efe0" FOREIGN KEY ("orderId") REFERENCES public."order"(id) ON DELETE CASCADE;


--
-- Name: order_item FK_69384323444206753f0cdeb64e0; Type: FK CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.order_item
    ADD CONSTRAINT "FK_69384323444206753f0cdeb64e0" FOREIGN KEY ("lineId") REFERENCES public.order_line(id) ON DELETE CASCADE;


--
-- Name: product_variant_facet_values_facet_value FK_69567bc225b6bbbd732d6c5455b; Type: FK CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.product_variant_facet_values_facet_value
    ADD CONSTRAINT "FK_69567bc225b6bbbd732d6c5455b" FOREIGN KEY ("productVariantId") REFERENCES public.product_variant(id) ON DELETE CASCADE;


--
-- Name: product_facet_values_facet_value FK_6a0558e650d75ae639ff38e413a; Type: FK CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.product_facet_values_facet_value
    ADD CONSTRAINT "FK_6a0558e650d75ae639ff38e413a" FOREIGN KEY ("productId") REFERENCES public.product(id) ON DELETE CASCADE;


--
-- Name: promotion_channels_channel FK_6d9e2c39ab12391aaa374bcdaa4; Type: FK CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.promotion_channels_channel
    ADD CONSTRAINT "FK_6d9e2c39ab12391aaa374bcdaa4" FOREIGN KEY ("promotionId") REFERENCES public.promotion(id) ON DELETE CASCADE;


--
-- Name: product_variant FK_6e420052844edf3a5506d863ce6; Type: FK CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.product_variant
    ADD CONSTRAINT "FK_6e420052844edf3a5506d863ce6" FOREIGN KEY ("productId") REFERENCES public.product(id);


--
-- Name: collection_product_variants_product_variant FK_6faa7b72422d9c4679e2f186ad1; Type: FK CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.collection_product_variants_product_variant
    ADD CONSTRAINT "FK_6faa7b72422d9c4679e2f186ad1" FOREIGN KEY ("collectionId") REFERENCES public.collection(id) ON DELETE CASCADE;


--
-- Name: collection_channels_channel FK_7216ab24077cf5cbece7857dbbd; Type: FK CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.collection_channels_channel
    ADD CONSTRAINT "FK_7216ab24077cf5cbece7857dbbd" FOREIGN KEY ("channelId") REFERENCES public.channel(id) ON DELETE CASCADE;


--
-- Name: collection FK_7256fef1bb42f1b38156b7449f5; Type: FK CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.collection
    ADD CONSTRAINT "FK_7256fef1bb42f1b38156b7449f5" FOREIGN KEY ("featuredAssetId") REFERENCES public.asset(id) ON DELETE SET NULL;


--
-- Name: zone_members_country FK_7350d77b6474313fbbaf4b094c1; Type: FK CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.zone_members_country
    ADD CONSTRAINT "FK_7350d77b6474313fbbaf4b094c1" FOREIGN KEY ("zoneId") REFERENCES public.zone(id) ON DELETE CASCADE;


--
-- Name: order_line FK_77be94ce9ec6504466179462275; Type: FK CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.order_line
    ADD CONSTRAINT "FK_77be94ce9ec6504466179462275" FOREIGN KEY ("taxCategoryId") REFERENCES public.tax_category(id);


--
-- Name: session FK_7a75399a4f4ffa48ee02e98c059; Type: FK CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.session
    ADD CONSTRAINT "FK_7a75399a4f4ffa48ee02e98c059" FOREIGN KEY ("activeOrderId") REFERENCES public."order"(id);


--
-- Name: zone_members_country FK_7baeecaf955e54bec73f998b0d5; Type: FK CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.zone_members_country
    ADD CONSTRAINT "FK_7baeecaf955e54bec73f998b0d5" FOREIGN KEY ("countryId") REFERENCES public.country(id) ON DELETE CASCADE;


--
-- Name: product_translation FK_7dbc75cb4e8b002620c4dbfdac5; Type: FK CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.product_translation
    ADD CONSTRAINT "FK_7dbc75cb4e8b002620c4dbfdac5" FOREIGN KEY ("baseId") REFERENCES public.product(id);


--
-- Name: tax_rate FK_7ee3306d7638aa85ca90d672198; Type: FK CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.tax_rate
    ADD CONSTRAINT "FK_7ee3306d7638aa85ca90d672198" FOREIGN KEY ("categoryId") REFERENCES public.tax_category(id);


--
-- Name: order_item_fulfillments_fulfillment FK_8132041a647c28eb27ecc1691fa; Type: FK CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.order_item_fulfillments_fulfillment
    ADD CONSTRAINT "FK_8132041a647c28eb27ecc1691fa" FOREIGN KEY ("fulfillmentId") REFERENCES public.fulfillment(id) ON DELETE CASCADE;


--
-- Name: shipping_method_translation FK_85ec26c71067ebc84adcd98d1a5; Type: FK CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.shipping_method_translation
    ADD CONSTRAINT "FK_85ec26c71067ebc84adcd98d1a5" FOREIGN KEY ("baseId") REFERENCES public.shipping_method(id);


--
-- Name: customer_groups_customer_group FK_85feea3f0e5e82133605f78db02; Type: FK CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.customer_groups_customer_group
    ADD CONSTRAINT "FK_85feea3f0e5e82133605f78db02" FOREIGN KEY ("customerGroupId") REFERENCES public.customer_group(id) ON DELETE CASCADE;


--
-- Name: tax_rate FK_8b5ab52fc8887c1a769b9276caf; Type: FK CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.tax_rate
    ADD CONSTRAINT "FK_8b5ab52fc8887c1a769b9276caf" FOREIGN KEY ("customerGroupId") REFERENCES public.customer_group(id);


--
-- Name: product FK_91a19e6613534949a4ce6e76ff8; Type: FK CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT "FK_91a19e6613534949a4ce6e76ff8" FOREIGN KEY ("featuredAssetId") REFERENCES public.asset(id) ON DELETE SET NULL;


--
-- Name: history_entry FK_92f8c334ef06275f9586fd01832; Type: FK CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.history_entry
    ADD CONSTRAINT "FK_92f8c334ef06275f9586fd01832" FOREIGN KEY ("administratorId") REFERENCES public.administrator(id);


--
-- Name: product_option_group_translation FK_93751abc1451972c02e033b766c; Type: FK CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.product_option_group_translation
    ADD CONSTRAINT "FK_93751abc1451972c02e033b766c" FOREIGN KEY ("baseId") REFERENCES public.product_option_group(id);


--
-- Name: tax_rate FK_9872fc7de2f4e532fd3230d1915; Type: FK CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.tax_rate
    ADD CONSTRAINT "FK_9872fc7de2f4e532fd3230d1915" FOREIGN KEY ("zoneId") REFERENCES public.zone(id);


--
-- Name: order_modification_order_items_order_item FK_9d631d7bd3d44af50eca535d728; Type: FK CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.order_modification_order_items_order_item
    ADD CONSTRAINT "FK_9d631d7bd3d44af50eca535d728" FOREIGN KEY ("orderItemId") REFERENCES public.order_item(id) ON DELETE CASCADE;


--
-- Name: asset_tags_tag FK_9e412b00d4c6cee1a4b3d920716; Type: FK CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.asset_tags_tag
    ADD CONSTRAINT "FK_9e412b00d4c6cee1a4b3d920716" FOREIGN KEY ("assetId") REFERENCES public.asset(id) ON DELETE CASCADE;


--
-- Name: order_line FK_9f065453910ea77d4be8e92618f; Type: FK CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.order_line
    ADD CONSTRAINT "FK_9f065453910ea77d4be8e92618f" FOREIGN KEY ("featuredAssetId") REFERENCES public.asset(id);


--
-- Name: order_modification_order_items_order_item FK_a48502a38aded69d087a8ec08ad; Type: FK CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.order_modification_order_items_order_item
    ADD CONSTRAINT "FK_a48502a38aded69d087a8ec08ad" FOREIGN KEY ("orderModificationId") REFERENCES public.order_modification(id) ON DELETE CASCADE;


--
-- Name: surcharge FK_a49c5271c39cc8174a0535c8088; Type: FK CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.surcharge
    ADD CONSTRAINT "FK_a49c5271c39cc8174a0535c8088" FOREIGN KEY ("orderModificationId") REFERENCES public.order_modification(id);


--
-- Name: product_channels_channel FK_a51dfbd87c330c075c39832b6e7; Type: FK CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.product_channels_channel
    ADD CONSTRAINT "FK_a51dfbd87c330c075c39832b6e7" FOREIGN KEY ("channelId") REFERENCES public.channel(id) ON DELETE CASCADE;


--
-- Name: order_item_fulfillments_fulfillment FK_a568a3d5aa7f237edab624960b9; Type: FK CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.order_item_fulfillments_fulfillment
    ADD CONSTRAINT "FK_a568a3d5aa7f237edab624960b9" FOREIGN KEY ("orderItemId") REFERENCES public.order_item(id) ON DELETE CASCADE;


--
-- Name: product_option FK_a6debf9198e2fbfa006aa10d710; Type: FK CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.product_option
    ADD CONSTRAINT "FK_a6debf9198e2fbfa006aa10d710" FOREIGN KEY ("groupId") REFERENCES public.product_option_group(id);


--
-- Name: product_option_group FK_a6e91739227bf4d442f23c52c75; Type: FK CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.product_option_group
    ADD CONSTRAINT "FK_a6e91739227bf4d442f23c52c75" FOREIGN KEY ("productId") REFERENCES public.product(id);


--
-- Name: product_option_translation FK_a79a443c1f7841f3851767faa6d; Type: FK CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.product_option_translation
    ADD CONSTRAINT "FK_a79a443c1f7841f3851767faa6d" FOREIGN KEY ("baseId") REFERENCES public.product_option(id);


--
-- Name: customer_channels_channel FK_a842c9fe8cd4c8ff31402d172d7; Type: FK CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.customer_channels_channel
    ADD CONSTRAINT "FK_a842c9fe8cd4c8ff31402d172d7" FOREIGN KEY ("customerId") REFERENCES public.customer(id) ON DELETE CASCADE;


--
-- Name: order_modification FK_ad2991fa2933ed8b7f86a716338; Type: FK CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.order_modification
    ADD CONSTRAINT "FK_ad2991fa2933ed8b7f86a716338" FOREIGN KEY ("paymentId") REFERENCES public.payment(id);


--
-- Name: facet_value_channels_channel FK_ad690c1b05596d7f52e52ffeedd; Type: FK CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.facet_value_channels_channel
    ADD CONSTRAINT "FK_ad690c1b05596d7f52e52ffeedd" FOREIGN KEY ("facetValueId") REFERENCES public.facet_value(id) ON DELETE CASCADE;


--
-- Name: channel FK_afe9f917a1c82b9e9e69f7c6129; Type: FK CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.channel
    ADD CONSTRAINT "FK_afe9f917a1c82b9e9e69f7c6129" FOREIGN KEY ("defaultTaxZoneId") REFERENCES public.zone(id);


--
-- Name: customer_groups_customer_group FK_b823a3c8bf3b78d3ed68736485c; Type: FK CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.customer_groups_customer_group
    ADD CONSTRAINT "FK_b823a3c8bf3b78d3ed68736485c" FOREIGN KEY ("customerId") REFERENCES public.customer(id) ON DELETE CASCADE;


--
-- Name: product_variant_channels_channel FK_beeb2b3cd800e589f2213ae99d6; Type: FK CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.product_variant_channels_channel
    ADD CONSTRAINT "FK_beeb2b3cd800e589f2213ae99d6" FOREIGN KEY ("productVariantId") REFERENCES public.product_variant(id) ON DELETE CASCADE;


--
-- Name: role_channels_channel FK_bfd2a03e9988eda6a9d11760119; Type: FK CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.role_channels_channel
    ADD CONSTRAINT "FK_bfd2a03e9988eda6a9d11760119" FOREIGN KEY ("roleId") REFERENCES public.role(id) ON DELETE CASCADE;


--
-- Name: payment_method_channels_channel FK_c00e36f667d35031087b382e61b; Type: FK CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.payment_method_channels_channel
    ADD CONSTRAINT "FK_c00e36f667d35031087b382e61b" FOREIGN KEY ("channelId") REFERENCES public.channel(id) ON DELETE CASCADE;


--
-- Name: channel FK_c9ca2f58d4517460435cbd8b4c9; Type: FK CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.channel
    ADD CONSTRAINT "FK_c9ca2f58d4517460435cbd8b4c9" FOREIGN KEY ("defaultShippingZoneId") REFERENCES public.zone(id);


--
-- Name: shipping_line FK_c9f34a440d490d1b66f6829b86c; Type: FK CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.shipping_line
    ADD CONSTRAINT "FK_c9f34a440d490d1b66f6829b86c" FOREIGN KEY ("orderId") REFERENCES public."order"(id);


--
-- Name: facet_channels_channel FK_ca796020c6d097e251e5d6d2b02; Type: FK CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.facet_channels_channel
    ADD CONSTRAINT "FK_ca796020c6d097e251e5d6d2b02" FOREIGN KEY ("facetId") REFERENCES public.facet(id) ON DELETE CASCADE;


--
-- Name: order_modification FK_cb66b63b6e97613013795eadbd5; Type: FK CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.order_modification
    ADD CONSTRAINT "FK_cb66b63b6e97613013795eadbd5" FOREIGN KEY ("refundId") REFERENCES public.refund(id);


--
-- Name: stock_movement FK_cbb0990e398bf7713aebdd38482; Type: FK CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.stock_movement
    ADD CONSTRAINT "FK_cbb0990e398bf7713aebdd38482" FOREIGN KEY ("orderItemId") REFERENCES public.order_item(id);


--
-- Name: order_line FK_cbcd22193eda94668e84d33f185; Type: FK CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.order_line
    ADD CONSTRAINT "FK_cbcd22193eda94668e84d33f185" FOREIGN KEY ("productVariantId") REFERENCES public.product_variant(id);


--
-- Name: collection_channels_channel FK_cdbf33ffb5d4519161251520083; Type: FK CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.collection_channels_channel
    ADD CONSTRAINT "FK_cdbf33ffb5d4519161251520083" FOREIGN KEY ("collectionId") REFERENCES public.collection(id) ON DELETE CASCADE;


--
-- Name: payment FK_d09d285fe1645cd2f0db811e293; Type: FK CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT "FK_d09d285fe1645cd2f0db811e293" FOREIGN KEY ("orderId") REFERENCES public."order"(id);


--
-- Name: order_channels_channel FK_d0d16db872499e83b15999f8c7a; Type: FK CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.order_channels_channel
    ADD CONSTRAINT "FK_d0d16db872499e83b15999f8c7a" FOREIGN KEY ("channelId") REFERENCES public.channel(id) ON DELETE CASCADE;


--
-- Name: facet_value FK_d101dc2265a7341be3d94968c5b; Type: FK CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.facet_value
    ADD CONSTRAINT "FK_d101dc2265a7341be3d94968c5b" FOREIGN KEY ("facetId") REFERENCES public.facet(id) ON DELETE CASCADE;


--
-- Name: product_variant_channels_channel FK_d194bff171b62357688a5d0f559; Type: FK CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.product_variant_channels_channel
    ADD CONSTRAINT "FK_d194bff171b62357688a5d0f559" FOREIGN KEY ("channelId") REFERENCES public.channel(id) ON DELETE CASCADE;


--
-- Name: stock_movement FK_d2c8d5fca981cc820131f81aa83; Type: FK CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.stock_movement
    ADD CONSTRAINT "FK_d2c8d5fca981cc820131f81aa83" FOREIGN KEY ("orderLineId") REFERENCES public.order_line(id);


--
-- Name: address FK_d87215343c3a3a67e6a0b7f3ea9; Type: FK CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.address
    ADD CONSTRAINT "FK_d87215343c3a3a67e6a0b7f3ea9" FOREIGN KEY ("countryId") REFERENCES public.country(id);


--
-- Name: address FK_dc34d382b493ade1f70e834c4d3; Type: FK CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.address
    ADD CONSTRAINT "FK_dc34d382b493ade1f70e834c4d3" FOREIGN KEY ("customerId") REFERENCES public.customer(id);


--
-- Name: asset_channels_channel FK_dc4e7435f9f5e9e6436bebd33bb; Type: FK CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.asset_channels_channel
    ADD CONSTRAINT "FK_dc4e7435f9f5e9e6436bebd33bb" FOREIGN KEY ("assetId") REFERENCES public.asset(id) ON DELETE CASCADE;


--
-- Name: customer_channels_channel FK_dc9f69207a8867f83b0fd257e30; Type: FK CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.customer_channels_channel
    ADD CONSTRAINT "FK_dc9f69207a8867f83b0fd257e30" FOREIGN KEY ("channelId") REFERENCES public.channel(id) ON DELETE CASCADE;


--
-- Name: role_channels_channel FK_e09dfee62b158307404202b43a5; Type: FK CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.role_channels_channel
    ADD CONSTRAINT "FK_e09dfee62b158307404202b43a5" FOREIGN KEY ("channelId") REFERENCES public.channel(id) ON DELETE CASCADE;


--
-- Name: facet_value_channels_channel FK_e1d54c0b9db3e2eb17faaf5919c; Type: FK CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.facet_value_channels_channel
    ADD CONSTRAINT "FK_e1d54c0b9db3e2eb17faaf5919c" FOREIGN KEY ("channelId") REFERENCES public.channel(id) ON DELETE CASCADE;


--
-- Name: shipping_line FK_e2e7642e1e88167c1dfc827fdf3; Type: FK CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.shipping_line
    ADD CONSTRAINT "FK_e2e7642e1e88167c1dfc827fdf3" FOREIGN KEY ("shippingMethodId") REFERENCES public.shipping_method(id);


--
-- Name: collection_translation FK_e329f9036210d75caa1d8f2154a; Type: FK CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.collection_translation
    ADD CONSTRAINT "FK_e329f9036210d75caa1d8f2154a" FOREIGN KEY ("baseId") REFERENCES public.collection(id) ON DELETE CASCADE;


--
-- Name: product_variant FK_e38dca0d82fd64c7cf8aac8b8ef; Type: FK CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.product_variant
    ADD CONSTRAINT "FK_e38dca0d82fd64c7cf8aac8b8ef" FOREIGN KEY ("taxCategoryId") REFERENCES public.tax_category(id);


--
-- Name: product_variant_price FK_e6126cd268aea6e9b31d89af9ab; Type: FK CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.product_variant_price
    ADD CONSTRAINT "FK_e6126cd268aea6e9b31d89af9ab" FOREIGN KEY ("variantId") REFERENCES public.product_variant(id);


--
-- Name: stock_movement FK_e65ba3882557cab4febb54809bb; Type: FK CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.stock_movement
    ADD CONSTRAINT "FK_e65ba3882557cab4febb54809bb" FOREIGN KEY ("productVariantId") REFERENCES public.product_variant(id);


--
-- Name: product_variant_options_product_option FK_e96a71affe63c97f7fa2f076dac; Type: FK CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.product_variant_options_product_option
    ADD CONSTRAINT "FK_e96a71affe63c97f7fa2f076dac" FOREIGN KEY ("productOptionId") REFERENCES public.product_option(id) ON DELETE CASCADE;


--
-- Name: facet_translation FK_eaea53f44bf9e97790d38a3d68f; Type: FK CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.facet_translation
    ADD CONSTRAINT "FK_eaea53f44bf9e97790d38a3d68f" FOREIGN KEY ("baseId") REFERENCES public.facet(id) ON DELETE CASCADE;


--
-- Name: session FK_eb87ef1e234444728138302263b; Type: FK CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.session
    ADD CONSTRAINT "FK_eb87ef1e234444728138302263b" FOREIGN KEY ("activeChannelId") REFERENCES public.channel(id);


--
-- Name: shipping_method_channels_channel FK_f0a17b94aa5a162f0d422920eb2; Type: FK CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.shipping_method_channels_channel
    ADD CONSTRAINT "FK_f0a17b94aa5a162f0d422920eb2" FOREIGN KEY ("shippingMethodId") REFERENCES public.shipping_method(id) ON DELETE CASCADE;


--
-- Name: shipping_method_channels_channel FK_f2b98dfb56685147bed509acc3d; Type: FK CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.shipping_method_channels_channel
    ADD CONSTRAINT "FK_f2b98dfb56685147bed509acc3d" FOREIGN KEY ("channelId") REFERENCES public.channel(id) ON DELETE CASCADE;


--
-- Name: product_variant_asset FK_fa21412afac15a2304f3eb35feb; Type: FK CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.product_variant_asset
    ADD CONSTRAINT "FK_fa21412afac15a2304f3eb35feb" FOREIGN KEY ("productVariantId") REFERENCES public.product_variant(id) ON DELETE CASCADE;


--
-- Name: collection_product_variants_product_variant FK_fb05887e2867365f236d7dd95ee; Type: FK CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.collection_product_variants_product_variant
    ADD CONSTRAINT "FK_fb05887e2867365f236d7dd95ee" FOREIGN KEY ("productVariantId") REFERENCES public.product_variant(id) ON DELETE CASCADE;


--
-- Name: asset_tags_tag FK_fb5e800171ffbe9823f2cc727fd; Type: FK CONSTRAINT; Schema: public; Owner: ghienan
--

ALTER TABLE ONLY public.asset_tags_tag
    ADD CONSTRAINT "FK_fb5e800171ffbe9823f2cc727fd" FOREIGN KEY ("tagId") REFERENCES public.tag(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

