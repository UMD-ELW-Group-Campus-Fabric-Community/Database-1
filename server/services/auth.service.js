const { query } = require("./database.service");

const authenticateToken = async (token, id) => {
  try {
    const sql = `SELECT * FROM Auth WHERE user_id = $1 AND token = $2`;
    const res = await query(sql, [id, token]);
    return res;
  } catch (err) {
    console.log(err);
    return err;
  }
};

const revalidateToken = async (id, token) => {
  try {
    let sql = `UPDATE User_Information u SET u.updated_at = NOW() JOIN Auth a ON u.id = a.id WHERE u.id = $1 AND a.token = $2`;
    const res = await query(sql, [id]);
    if (res.rowCount > 0) {
      sql = `SELECT user_id, token, token_expiry FROM vauth WHERE id = $1`;
      const res = await query(sql, [id]);
      return res;
    }
    return new Error("Could not revalidate token");
  } catch (err) {
    console.log(err);
    return err;
  }
};

const login = async (email, password) => {
  try {
    const sql = `SELECT user_id, token, token_expiry FROM vauth WHERE email = $1 AND _password = crypt($2, _salt)`;
    const res = await query(sql, [email, password]);
    return res;
  } catch (err) {
    console.log(err);
    return err;
  }
};

const getUser = async (id) => {
  try {
    const sql = `SELECT * FROM vuser WHERE id = $1`;
    const res = await query(sql, [id]);
    return res;
  } catch (err) {
    console.log(err);
    return err;
  }
};

const register = async (
  id,
  firstName,
  lastName,
  email,
  password,
  organizationId,
  privilegeId
) => {
  const sql = `INSERT INTO User_Information 
        (id, first_name, last_name, email, _password, organization_id, privilege_id)
         VALUES ($1, $2, $3, $4, $5, $6, $7)`;
  const res = await query(sql, [
    id,
    firstName,
    lastName,
    email,
    password,
    organizationId,
    privilegeId,
  ]);
  return res;
};

const update = async (
  id,
  firstName,
  lastName,
  email,
  password,
  organizationId,
  privilegeId
) => {
  const sql = `UPDATE User_Information SET first_name = $1, last_name = $2, email = $3, password = $4, organization_id = $5, privilege_id = $6 WHERE id = $7`;
  const res = await query(sql, [
    firstName,
    lastName,
    email,
    password,
    organizationId,
    privilegeId,
    id,
  ]);
  return res;
};

module.exports = {
  authenticateToken,
  revalidateToken,
  login,
  register,
  update,
  getUser,
};
